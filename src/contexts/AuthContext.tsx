'use client'

import { createContext, useContext, useState, useEffect, ReactNode } from 'react'

interface StoreInfo {
  id: number;
  slug: string;
  name: string;
}

interface User {
  id?: string
  fullName: string
  email: string
  phone: string
  departmentId?: number
  municipalityId?: number
  store?: StoreInfo | null;
}

interface AuthContextType {
  user: User | null
  login: (userData: User) => void
  logout: () => void
  updateUser: (userData: Partial<User>) => void
  isAuthenticated: boolean
  hasStore: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    const checkAuth = async () => {
      setIsLoading(true);
      try {
        let currentUser: User | null = null;
        let storedUserJson: string | null = null;

        if (typeof window !== 'undefined') {
          storedUserJson = localStorage.getItem('user');
        }

        if (storedUserJson) {
          const parsedUser: User = JSON.parse(storedUserJson);
          currentUser = parsedUser;
        }

        // Always verify with API if user is not fully loaded or if we need fresh store info
        const response = await fetch('/api/auth/me');
        if (response.ok) {
          const userData = await response.json();
          if (userData.success && userData.user) {
            currentUser = userData.user; // Get fresh user data from API
            
            // Fetch store info
            const storeResponse = await fetch('/api/user/store');
            if (storeResponse.ok) {
              const storeData = await storeResponse.json();
              if (storeData.success && storeData.data) {
                currentUser = { ...currentUser, store: storeData.data };
              } else {
                currentUser = { ...currentUser, store: null };
              }
            } else {
              console.error('Failed to fetch store info');
              currentUser = { ...currentUser, store: null };
            }
          }
        }
        
        setUser(currentUser);
        if (typeof window !== 'undefined') {
          if (currentUser) {
            localStorage.setItem('user', JSON.stringify(currentUser));
          } else {
            localStorage.removeItem('user');
          }
        }

      } catch (error) {
        console.error('Error checking auth:', error);
        setUser(null);
        if (typeof window !== 'undefined') {
          localStorage.removeItem('user');
        }
      } finally {
        setIsLoading(false);
      }
    };

    checkAuth();
  }, []);

  const login = async (userData: User) => {
    // Assuming userData from login already has basic user info but no store info initially
    // Store info will be fetched by checkAuth on subsequent renders or full page load
    setUser({ ...userData, store: null });
    if (typeof window !== 'undefined') {
      localStorage.setItem('user', JSON.stringify({ ...userData, store: null }));
    }
    // You might want to re-run checkAuth after login to immediately get store info
    // This can be done by calling checkAuth() here or by having a separate 'refreshAuth' function.
    // For simplicity, relying on checkAuth on next render/load for store info.
  };

  const logout = async () => {
    try {
      await fetch('/api/auth/logout', { method: 'POST' });
    } catch (error) {
      console.error('Error logout:', error);
    } finally {
      setUser(null);
      if (typeof window !== 'undefined') {
        localStorage.removeItem('user');
      }
    }
  };

  const updateUser = (userData: Partial<User>) => {
    if (user) {
      const updatedUser = { ...user, ...userData };
      setUser(updatedUser);
      if (typeof window !== 'undefined') {
        localStorage.setItem('user', JSON.stringify(updatedUser));
      }
    }
  };

  const value: AuthContextType = {
    user,
    login,
    logout,
    updateUser,
    isAuthenticated: !!user,
    hasStore: !!user?.store
  };

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}

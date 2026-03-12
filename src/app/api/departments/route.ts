
import { NextResponse } from "next/server";
import { getDb } from "@/db"; // Importar la función getDb
import { departments, municipalities } from "@/db/schema";

// Datos de fallback temporales para producción
const fallbackData = {
  departments: [
    { id: 1, name: "Santa Cruz" },
    { id: 2, name: "La Paz" },
    { id: 3, name: "Cochabamba" },
    { id: 4, name: "Chuquisaca" },
    { id: 5, name: "Oruro" },
    { id: 6, name: "Potosí" },
    { id: 7, name: "Tarija" },
    { id: 8, name: "Beni" },
    { id: 9, name: "Pando" },
    { id: 10, name: "El Alto" }
  ],
  municipalities: [
    { id: 1, name: "Santa Cruz de la Sierra", departmentId: 1 },
    { id: 2, name: "La Paz", departmentId: 2 },
    { id: 3, name: "Cochabamba", departmentId: 3 },
    { id: 4, name: "Sucre", departmentId: 4 },
    { id: 5, name: "Oruro", departmentId: 5 },
    { id: 6, name: "Potosí", departmentId: 6 },
    { id: 7, name: "Tarija", departmentId: 7 },
    { id: 8, name: "Trinidad", departmentId: 8 },
    { id: 9, name: "Cobija", departmentId: 9 },
    { id: 10, name: "El Alto", departmentId: 10 }
  ]
};

export async function GET() {
  console.log("API ROUTE: /api/departments - GET request received.");
  try {
    console.log("Attempting to get DB instance...");
    const db = getDb();
    console.log("DB instance obtained. Querying departments...");
    
    const allDepartments = await db.select().from(departments);
    console.log(`Successfully queried ${allDepartments.length} departments.`);
    
    console.log("Querying municipalities...");
    const allMunicipalities = await db.select().from(municipalities);
    console.log(`Successfully queried ${allMunicipalities.length} municipalities.`);

    return NextResponse.json({
      success: true, // Add a success flag
      departments: allDepartments,
      municipalities: allMunicipalities,
    });
  } catch (error) {
    console.error("[API_ERROR] /api/departments:", error);
    const errorMessage = error instanceof Error ? error.message : "An unknown server error occurred";
    
    // Si falla la base de datos (variables de entorno no configuradas), usar fallback
    console.log("Database connection failed in production, using fallback data");
    return NextResponse.json({
      success: true,
      departments: fallbackData.departments,
      municipalities: fallbackData.municipalities,
      fallback: true,
      message: "Using fallback data - please configure environment variables"
    });
  }
}

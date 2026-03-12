
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import * as dotenv from 'dotenv';
import { departments, municipalities } from './schema';

dotenv.config({ path: '.env' });

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error('DATABASE_URL is not set in .env');
}

const client = postgres(connectionString);
const db = drizzle(client);

const boliviaData = [
  {
    department: 'Chuquisaca',
    municipalities: [
      'Yamparaez', 'Tarabuco', 'Zudañez', 'Padilla', 'Tomina', 'Sopachuy',
      'Villa Alcalá', 'El Villar', 'Icla', 'Villa Serrano', 'Mojocoya',
      'Incahuasi', 'San Lucas', 'Camargo', 'Culpina', 'Las Carreras',
      'Villa Charcas', 'Villa Abecia'
    ]
  },
  {
    department: 'La Paz',
    municipalities: [
      'La Paz', 'Palca', 'Mecapaca', 'Achocalla', 'El Alto', 'Achacachi',
      'Ancoraimes', 'Chua Cocani', 'Huarina', 'Santiago de Huata', 'Huatajata',
      'Sorata', 'Guanay', 'Tacacoma', 'Tipuani', 'Mapiri', 'Teoponte',
      'Apolo', 'Pelechuco', 'Coroico', 'Coripata', 'Yanacachi', 'Chulumani',
      'Irupana', 'Cajuata', 'Colquiri', 'Inquisivi', 'Quime', 'Ichoca',
      'Licoma Pampa', 'Luribay', 'Sapahaqui', 'Yaco', 'Malla', 'Cairoma',
      'Pucarani', 'Laja', 'Batallas', 'Tiahuanaco', 'Taraco', 'Viacha',
      'Guaqui', 'Desaguadero', 'San Andrés de Machaca', 'Jesús de Machaca',
      'Sica Sica', 'Umala', 'Ayo Ayo', 'Calamarca', 'Patacamaya', 'Colquencha',
      'Comanche', 'Charazani', 'Curva', 'Chuma', 'Ayata', 'Aucapata',
      'Copacabana', 'San Pedro de Tiquina', 'Tito Yupanqui', 'Ixiamas',
      'San Buenaventura', 'Gral. J.J. Perez', 'Santiago de Callapa',
      'San Pedro de Curahuara', 'Papel Pampa', 'Chacarilla', 'Catacora',
      'Nazacara de Pacajes', 'Humanata', 'Escoma', 'Puerto Acosta',
      'Mocomoco', 'Puerto Carabuco', 'Charaña', 'Waldo Ballivian',
      'Calacoto', 'Caquiaviri', 'Coro Coro', 'Alto Beni', 'Caranavi'
    ]
  },
  {
    department: 'Cochabamba',
    municipalities: [
        'Cochabamba', 'Colcapirhua', 'Quillacollo', 'Sipe Sipe', 'Tiquipaya',
        'Vinto', 'Sacaba', 'Arani', 'Vacas', 'Arque', 'Tacopaya', 'Ayopaya',
        'Cocapata', 'Independencia', 'Bolívar', 'Capinota', 'Santivañez',
        'Sicaya', 'Villa Gualberto Villarroel', 'Chapare', 'Colomi', 'Villa Tunari',
        'Tarata', 'Anzaldo', 'Arbieto', 'Sacabamba', 'Esteban Arce', 'Mizque',
        'Vila Vila', 'Alalay', 'Aiquile', 'Pasorapa', 'Omereque', 'Totora',
        'Pojo', 'Pocona', 'Chimore', 'Puerto Villarroel', 'Entre Rios', 'Punata',
        'Villa Rivero', 'San Benito', 'Tacachi', 'Cliza', 'Toco', 'Tolata',
        'Tapacari', 'Tiraque', 'Shinahota'
    ]
  },
  {
    department: 'Oruro',
    municipalities: [
      'Oruro', 'Caracollo', 'El Choro', 'Paria', 'Challapata', 'Quillacas',
      'Poopó', 'Pazña', 'Antequera', 'Huanuni', 'Machacamarca', 'Corque',
      'Choquecota', 'Turco', 'Huachacalla', 'Escara', 'Cruz de Machacamarca',
      'Toledo', 'Eucaliptus', 'Salinas de Garci Mendoza', 'Pampa Aullagas',
      'Sabaya', 'Coipasa', 'Chipaya', 'Santiago de Andamarca', 'Belén de Andamarca'
    ]
  },
  {
    department: 'Potosí',
    municipalities: [
      'Potosí', 'Tinguipaya', 'Yocalla', 'Caiza "D"', 'Chaquí', 'Tupiza',
      'Betanzos', 'Chaqui', 'Tacobamba', 'Uncía', 'Chayanta', 'Llallagua',
      'Sacaca', 'Caripuyo', 'Acasio', 'San Pedro de Buena Vista', 'Toro Toro',
      'Colquechaca', 'Ravelo', 'Ocurí', 'Pocoata', 'Cotagaita', 'Vitichi',
      'San Pedro de Quemes', 'Uyuni', 'Tomave', 'Porco', 'Llica', 'Tahua'
    ]
  },
  {
    department: 'Tarija',
    municipalities: [
      'Tarija', 'Padcaya', 'Bermejo', 'Yacuiba', 'Carcani', 'Villamontes',
      'El Puente', 'Yunchará', 'San Lorenzo', 'Uriondo', 'Entre Ríos'
    ]
  },
  {
    department: 'Santa Cruz',
    municipalities: [
      'Santa Cruz de la Sierra', 'Cotoca', 'Porongo', 'La Guardia', 'El Torno',
      'Warnes', 'Montero', 'Saavedra', 'Mineros', 'Fernández Alonso', 'San Pedro',
      'Buena Vista', 'San Carlos', 'Yapacaní', 'San Juan de Yapacaní', 'Samaipata',
      'La Angostura', 'Mairana', 'Pampa Grande', 'Quirusillas', 'Vallegrande',
      'Trigal', 'Moro Moro', 'Postrer Valle', 'Pucara', 'Cabezas', 'Charagua',
      'Cuevo', 'Gutiérrez', 'Camiri', 'Lagunillas', 'Boyuibe', 'San Antonio de Lomerío',
      'San Ignacio', 'San Miguel', 'San Rafael', 'Roboré', 'San José', 'Pailón',
      'Puerto Suárez', 'Puerto Quijarro', 'Carmen Rivero Tórrez', 'San Julián',
      'San Ramón', 'San Javier', 'Concepción', 'San Matías', 'Urubichá',
      'Ascensión de Guarayos', 'El Puente', 'Cuatro Cañadas', 'Colpa Belgica'
    ]
  },
  {
    department: 'Beni',
    municipalities: [
      'Trinidad', 'San Javier', 'Riberalta', 'Guayaramerín', 'Reyes', 'San Borja',
      'Santa Rosa', 'Rurrenabaque', 'Santa Ana del Yacuma', 'Exaltación',
      'San Ignacio de Moxos', 'Loreto', 'San Andrés', 'San Joaquín', 'San Ramón',
      'Puerto Siles', 'Magdalena', 'Baures', 'Huacaraje'
    ]
  },
  {
    department: 'Pando',
    municipalities: [
      'Cobija', 'Porvenir', 'Bolpebra', 'Bella Flor', 'Puerto Rico', 'San Pedro',
      'Filadelfia', 'Ingavi', 'Nueva Esperanza', 'Villa Nueva', 'Santos Mercado',
      'Santa Rosa del Abuná', 'E Sena', 'San Lorenzo'
    ]
  },
  {
      department: 'El Alto',
      municipalities: ['El Alto']
  }
];

async function main() {
  try {
    console.log('Seeding database...');

    for (const d of boliviaData) {
      const [department] = await db.insert(departments).values({ name: d.department }).returning({ id: departments.id });
      const municipalityData = d.municipalities.map(m => ({ name: m, departmentId: department.id }));
      await db.insert(municipalities).values(municipalityData);
    }

    console.log('Database seeded successfully!');
  } catch (error) {
    console.error('Error seeding database:', error);
    process.exit(1);
  } finally {
    await client.end();
    console.log('Connection closed.');
  }
}

main();

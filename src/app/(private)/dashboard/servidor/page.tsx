// src/app/dashboard/servidor/page.tsx

import { ServidorDashboard } from "@/components/dashboard/servidor/ServidorDashboard"; 
import { servidorDashboardMock } from "@/components/dashboard/data";

export default function ServidorDashboardPage() {
  return <ServidorDashboard data={servidorDashboardMock} />;
}
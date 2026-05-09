// app/dashboard/gestor/page.tsx

export default function GestorPage() {
  return (
    <AppShell>
      <PageTitle
        title="Dashboard do Gestor"
        description="Visão geral da equipe"
      />

      <DashboardCardGrid />

      <div className="grid gap-6 lg:grid-cols-3">
        <DashboardTeamStatus />

        <DashboardQuickActions />

        <DashboardAlerts />
      </div>

      <div className="grid gap-6 lg:grid-cols-2">
        <DashboardPendencies />

        <DashboardBankHours />
      </div>
    </AppShell>
  );
}
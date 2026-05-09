// components/layout/app-shell.tsx

interface AppShellProps {
  children: React.ReactNode;
}

export function AppShell({
  children,
}: AppShellProps) {
  return (
    <div className="min-h-screen bg-[#F5F7F8]">
      <AppSidebar />

      <main className="lg:pl-[280px]">
        <AppHeader />

        <PageContainer>
          {children}
        </PageContainer>
      </main>
    </div>
  );
}
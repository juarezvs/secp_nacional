// src/features/servidor/dashboard/components/ServidorDashboard.tsx

import { ServidorDashboardData } from "../types";
import { DashboardHeader } from "./DashboardHeader";
import { RegistroPontoCard } from "./RegistroPontoCard";
import { ResumoCard } from "./ResumoCard";
import { JornadaHojeCard } from "./JornadaHojeCard";
import { SaldoBancoHorasCard } from "./SaldoBancoHorasCard";
import { SolicitacoesRecentesCard } from "./SolicitacoesRecentesCard";
import { PendenciasCard } from "./PendenciasCard";
import { HistoricoSemanaCard } from "./HistoricoSemanaCard";

interface ServidorDashboardProps {
  data: ServidorDashboardData;
}

export function ServidorDashboard({ data }: ServidorDashboardProps) {
  return (
    <main className="min-h-screen bg-slate-50 px-4 py-6 text-slate-950 dark:bg-slate-950 dark:text-slate-50 sm:px-6 lg:px-8">
      <div className="mx-auto flex w-full max-w-7xl flex-col gap-6">
        <DashboardHeader servidor={data.servidor} />

        <section className="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-4">
          <ResumoCard
            title="Jornada de hoje"
            value={data.jornadaHoje.horasTrabalhadas}
            description={`Carga prevista: ${data.jornadaHoje.cargaHoraria}`}
            status="Em andamento"
          />

          <ResumoCard
            title="Saldo atual"
            value={data.bancoHoras.saldoAtual}
            description="Banco de horas consolidado"
            status="Atualizado"
          />

          <ResumoCard
            title="Atrasos no mês"
            value={data.bancoHoras.atrasosMes}
            description="Total acumulado no período"
            status="Mensal"
          />

          <ResumoCard
            title="Faltas no mês"
            value={String(data.bancoHoras.faltasMes)}
            description="Ocorrências registradas"
            status="Regular"
          />
        </section>

        <section className="grid grid-cols-1 gap-6 xl:grid-cols-3">
          <div className="xl:col-span-2">
            <RegistroPontoCard jornada={data.jornadaHoje} />
          </div>

          <JornadaHojeCard jornada={data.jornadaHoje} />
        </section>

        <section className="grid grid-cols-1 gap-6 xl:grid-cols-3">
          <SaldoBancoHorasCard bancoHoras={data.bancoHoras} />

          <div className="xl:col-span-2">
            <HistoricoSemanaCard historico={data.historicoSemana} />
          </div>
        </section>

        <section className="grid grid-cols-1 gap-6 xl:grid-cols-2">
          <SolicitacoesRecentesCard solicitacoes={data.solicitacoesRecentes} />

          <PendenciasCard pendencias={data.pendencias} />
        </section>
      </div>
    </main>
  );
}
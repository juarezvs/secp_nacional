// src/features/servidor/dashboard/components/SolicitacoesRecentesCard.tsx

import { SolicitacaoRecente } from "../types";

interface SolicitacoesRecentesCardProps {
  solicitacoes: SolicitacaoRecente[];
}

function tipoLabel(tipo: SolicitacaoRecente["tipo"]) {
  const labels = {
    ABONO: "Abono",
    AJUSTE_PONTO: "Ajuste de ponto",
    FOLGA: "Folga",
    JUSTIFICATIVA: "Justificativa",
    COMPENSACAO: "Compensação",
  };

  return labels[tipo];
}

function statusClasses(status: SolicitacaoRecente["status"]) {
  const classes = {
    PENDENTE:
      "bg-amber-100 text-amber-800 dark:bg-amber-950 dark:text-amber-200",
    APROVADA:
      "bg-emerald-100 text-emerald-800 dark:bg-emerald-950 dark:text-emerald-200",
    REJEITADA: "bg-red-100 text-red-800 dark:bg-red-950 dark:text-red-200",
    CANCELADA:
      "bg-slate-100 text-slate-700 dark:bg-slate-800 dark:text-slate-300",
  };

  return classes[status];
}

export function SolicitacoesRecentesCard({
  solicitacoes,
}: SolicitacoesRecentesCardProps) {
  return (
    <section className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-800 dark:bg-slate-900">
      <div className="flex items-center justify-between gap-4">
        <div>
          <p className="text-sm font-medium text-slate-500 dark:text-slate-400">
            Solicitações
          </p>

          <h2 className="mt-2 text-xl font-bold">Movimentações recentes</h2>
        </div>

        <button
          type="button"
          className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 dark:border-slate-700 dark:text-slate-200 dark:hover:bg-slate-800"
        >
          Ver todas
        </button>
      </div>

      <div className="mt-5 space-y-3">
        {solicitacoes.map((solicitacao) => (
          <article
            key={solicitacao.id}
            className="rounded-2xl bg-slate-50 p-4 dark:bg-slate-800"
          >
            <div className="flex flex-col gap-2 sm:flex-row sm:items-start sm:justify-between">
              <div>
                <p className="font-semibold">{tipoLabel(solicitacao.tipo)}</p>
                <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
                  {solicitacao.descricao}
                </p>
                <p className="mt-2 text-xs text-slate-400">
                  {solicitacao.data}
                </p>
              </div>

              <span
                className={`w-fit rounded-full px-3 py-1 text-xs font-semibold ${statusClasses(
                  solicitacao.status
                )}`}
              >
                {solicitacao.status}
              </span>
            </div>
          </article>
        ))}
      </div>
    </section>
  );
}
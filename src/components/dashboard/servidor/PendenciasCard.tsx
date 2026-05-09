// src/features/servidor/dashboard/components/PendenciasCard.tsx

import { PendenciaServidor } from "../types";

interface PendenciasCardProps {
  pendencias: PendenciaServidor[];
}

function prioridadeLabel(prioridade: PendenciaServidor["prioridade"]) {
  const labels = {
    BAIXA: "Baixa",
    MEDIA: "Média",
    ALTA: "Alta",
  };

  return labels[prioridade];
}

function prioridadeClasses(prioridade: PendenciaServidor["prioridade"]) {
  const classes = {
    BAIXA: "bg-slate-100 text-slate-700 dark:bg-slate-800 dark:text-slate-300",
    MEDIA: "bg-amber-100 text-amber-800 dark:bg-amber-950 dark:text-amber-200",
    ALTA: "bg-red-100 text-red-800 dark:bg-red-950 dark:text-red-200",
  };

  return classes[prioridade];
}

export function PendenciasCard({ pendencias }: PendenciasCardProps) {
  return (
    <section className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-800 dark:bg-slate-900">
      <p className="text-sm font-medium text-slate-500 dark:text-slate-400">
        Pendências
      </p>

      <h2 className="mt-2 text-xl font-bold">Ações recomendadas</h2>

      <div className="mt-5 space-y-3">
        {pendencias.length === 0 ? (
          <div className="rounded-2xl bg-emerald-50 p-4 text-sm font-medium text-emerald-800 dark:bg-emerald-950 dark:text-emerald-200">
            Nenhuma pendência encontrada.
          </div>
        ) : (
          pendencias.map((pendencia) => (
            <article
              key={pendencia.id}
              className="rounded-2xl bg-slate-50 p-4 dark:bg-slate-800"
            >
              <div className="flex flex-col gap-2 sm:flex-row sm:items-start sm:justify-between">
                <div>
                  <p className="font-semibold">{pendencia.titulo}</p>
                  <p className="mt-1 text-sm text-slate-500 dark:text-slate-400">
                    {pendencia.descricao}
                  </p>
                </div>

                <span
                  className={`w-fit rounded-full px-3 py-1 text-xs font-semibold ${prioridadeClasses(
                    pendencia.prioridade
                  )}`}
                >
                  {prioridadeLabel(pendencia.prioridade)}
                </span>
              </div>
            </article>
          ))
        )}
      </div>
    </section>
  );
}
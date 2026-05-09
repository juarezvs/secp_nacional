// src/features/servidor/dashboard/components/HistoricoSemanaCard.tsx

import { HistoricoSemanaItem } from "../types";

interface HistoricoSemanaCardProps {
  historico: HistoricoSemanaItem[];
}

function statusLabel(status: HistoricoSemanaItem["status"]) {
  const labels = {
    REGULAR: "Regular",
    INCOMPLETO: "Incompleto",
    PENDENTE: "Pendente",
    AUSENTE: "Ausente",
    EM_ANDAMENTO: "Em andamento",
  };

  return labels[status];
}

function statusClasses(status: HistoricoSemanaItem["status"]) {
  const classes = {
    REGULAR:
      "bg-emerald-100 text-emerald-800 dark:bg-emerald-950 dark:text-emerald-200",
    INCOMPLETO:
      "bg-amber-100 text-amber-800 dark:bg-amber-950 dark:text-amber-200",
    PENDENTE:
      "bg-amber-100 text-amber-800 dark:bg-amber-950 dark:text-amber-200",
    AUSENTE: "bg-red-100 text-red-800 dark:bg-red-950 dark:text-red-200",
    EM_ANDAMENTO:
      "bg-blue-100 text-blue-800 dark:bg-blue-950 dark:text-blue-200",
  };

  return classes[status];
}

export function HistoricoSemanaCard({ historico }: HistoricoSemanaCardProps) {
  return (
    <section className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-800 dark:bg-slate-900">
      <div className="flex items-center justify-between gap-4">
        <div>
          <p className="text-sm font-medium text-slate-500 dark:text-slate-400">
            Histórico semanal
          </p>

          <h2 className="mt-2 text-xl font-bold">Últimos registros</h2>
        </div>

        <button
          type="button"
          className="rounded-xl border border-slate-300 px-4 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100 dark:border-slate-700 dark:text-slate-200 dark:hover:bg-slate-800"
        >
          Espelho
        </button>
      </div>

      <div className="mt-5 overflow-hidden rounded-2xl border border-slate-200 dark:border-slate-800">
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-slate-200 text-sm dark:divide-slate-800">
            <thead className="bg-slate-50 dark:bg-slate-800">
              <tr>
                <th className="px-4 py-3 text-left font-semibold">Dia</th>
                <th className="px-4 py-3 text-left font-semibold">Entrada</th>
                <th className="px-4 py-3 text-left font-semibold">Saída</th>
                <th className="px-4 py-3 text-left font-semibold">Horas</th>
                <th className="px-4 py-3 text-left font-semibold">Status</th>
              </tr>
            </thead>

            <tbody className="divide-y divide-slate-200 bg-white dark:divide-slate-800 dark:bg-slate-900">
              {historico.map((item) => (
                <tr key={`${item.dia}-${item.data}`}>
                  <td className="whitespace-nowrap px-4 py-3">
                    <div className="font-semibold">{item.dia}</div>
                    <div className="text-xs text-slate-500 dark:text-slate-400">
                      {item.data}
                    </div>
                  </td>

                  <td className="whitespace-nowrap px-4 py-3">
                    {item.entrada ?? "—"}
                  </td>

                  <td className="whitespace-nowrap px-4 py-3">
                    {item.saida ?? "—"}
                  </td>

                  <td className="whitespace-nowrap px-4 py-3">
                    {item.horas}
                  </td>

                  <td className="whitespace-nowrap px-4 py-3">
                    <span
                      className={`rounded-full px-3 py-1 text-xs font-semibold ${statusClasses(
                        item.status
                      )}`}
                    >
                      {statusLabel(item.status)}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </section>
  );
}
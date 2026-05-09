// src/features/servidor/dashboard/components/JornadaHojeCard.tsx

import { JornadaHoje } from "../types";

interface JornadaHojeCardProps {
  jornada: JornadaHoje;
}

function statusLabel(status: JornadaHoje["status"]) {
  const labels = {
    REGULAR: "Regular",
    INCOMPLETO: "Incompleto",
    PENDENTE: "Pendente",
    AUSENTE: "Ausente",
    EM_ANDAMENTO: "Em andamento",
  };

  return labels[status];
}

export function JornadaHojeCard({ jornada }: JornadaHojeCardProps) {
  const registros = [
    { label: "Entrada", value: jornada.entrada ?? "Não registrado" },
    {
      label: "Saída intervalo",
      value: jornada.saidaIntervalo ?? "Não registrado",
    },
    {
      label: "Retorno intervalo",
      value: jornada.retornoIntervalo ?? "Não registrado",
    },
    { label: "Saída", value: jornada.saida ?? "Não registrado" },
  ];

  return (
    <section className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-800 dark:bg-slate-900">
      <div className="flex items-start justify-between gap-4">
        <div>
          <p className="text-sm font-medium text-slate-500 dark:text-slate-400">
            Jornada de hoje
          </p>

          <h2 className="mt-2 text-xl font-bold">Registros do dia</h2>
        </div>

        <span className="rounded-full bg-amber-100 px-3 py-1 text-xs font-semibold text-amber-800 dark:bg-amber-950 dark:text-amber-200">
          {statusLabel(jornada.status)}
        </span>
      </div>

      <div className="mt-5 space-y-3">
        {registros.map((registro) => (
          <div
            key={registro.label}
            className="flex items-center justify-between rounded-2xl bg-slate-50 px-4 py-3 text-sm dark:bg-slate-800"
          >
            <span className="text-slate-500 dark:text-slate-400">
              {registro.label}
            </span>

            <span className="font-semibold">{registro.value}</span>
          </div>
        ))}
      </div>
    </section>
  );
}
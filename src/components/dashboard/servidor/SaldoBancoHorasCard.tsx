// src/features/servidor/dashboard/components/SaldoBancoHorasCard.tsx

import { SaldoBancoHoras } from "../types";

interface SaldoBancoHorasCardProps {
  bancoHoras: SaldoBancoHoras;
}

export function SaldoBancoHorasCard({ bancoHoras }: SaldoBancoHorasCardProps) {
  return (
    <section className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-800 dark:bg-slate-900">
      <p className="text-sm font-medium text-slate-500 dark:text-slate-400">
        Banco de horas
      </p>

      <h2 className="mt-2 text-xl font-bold">Resumo do período</h2>

      <div className="mt-6 space-y-4">
        <div>
          <p className="text-sm text-slate-500 dark:text-slate-400">
            Saldo atual
          </p>
          <p className="mt-1 text-3xl font-bold">{bancoHoras.saldoAtual}</p>
        </div>

        <div className="grid grid-cols-1 gap-3 sm:grid-cols-3 xl:grid-cols-1">
          <div className="rounded-2xl bg-slate-50 p-4 dark:bg-slate-800">
            <p className="text-xs text-slate-500 dark:text-slate-400">
              Saldo no mês
            </p>
            <p className="mt-1 font-semibold">{bancoHoras.saldoMes}</p>
          </div>

          <div className="rounded-2xl bg-slate-50 p-4 dark:bg-slate-800">
            <p className="text-xs text-slate-500 dark:text-slate-400">
              Atrasos
            </p>
            <p className="mt-1 font-semibold">{bancoHoras.atrasosMes}</p>
          </div>

          <div className="rounded-2xl bg-slate-50 p-4 dark:bg-slate-800">
            <p className="text-xs text-slate-500 dark:text-slate-400">
              Faltas
            </p>
            <p className="mt-1 font-semibold">{bancoHoras.faltasMes}</p>
          </div>
        </div>
      </div>
    </section>
  );
}
// src/features/servidor/dashboard/components/DashboardHeader.tsx

import { ServidorResumo } from "../types";

interface DashboardHeaderProps {
  servidor: ServidorResumo;
}

export function DashboardHeader({ servidor }: DashboardHeaderProps) {
  return (
    <header className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-800 dark:bg-slate-900">
      <div className="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
        <div>
          <p className="text-sm font-medium text-slate-500 dark:text-slate-400">
            Dashboard do Servidor
          </p>

          <h1 className="mt-1 text-2xl font-bold tracking-tight sm:text-3xl">
            Olá, {servidor.nome}
          </h1>

          <p className="mt-2 max-w-3xl text-sm text-slate-600 dark:text-slate-300">
            Acompanhe sua jornada, registros de ponto, banco de horas,
            solicitações e pendências funcionais.
          </p>
        </div>

        <div className="rounded-2xl bg-slate-100 p-4 text-sm dark:bg-slate-800">
          <div className="grid gap-1">
            <p>
              <span className="font-semibold">Matrícula:</span>{" "}
              {servidor.matricula}
            </p>
            <p>
              <span className="font-semibold">Unidade:</span> {servidor.unidade}
            </p>
            <p>
              <span className="font-semibold">Gestor:</span> {servidor.gestor}
            </p>
          </div>
        </div>
      </div>
    </header>
  );
}
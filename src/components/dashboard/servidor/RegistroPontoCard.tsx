// src/features/servidor/dashboard/components/RegistroPontoCard.tsx

"use client";

import { useEffect, useState } from "react";
import { JornadaHoje } from "../types";

interface RegistroPontoCardProps {
  jornada: JornadaHoje;
}

function getCurrentTime() {
  return new Intl.DateTimeFormat("pt-BR", {
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit",
  }).format(new Date());
}

export function RegistroPontoCard({ jornada }: RegistroPontoCardProps) {
  const [horaAtual, setHoraAtual] = useState(getCurrentTime());
  const [mensagem, setMensagem] = useState<string | null>(null);

  useEffect(() => {
    const interval = window.setInterval(() => {
      setHoraAtual(getCurrentTime());
    }, 1000);

    return () => window.clearInterval(interval);
  }, []);

  function handleRegistrarPonto() {
    setMensagem(
      "Registro simulado com sucesso. Integre este botão à API real do SECP."
    );
  }

  return (
    <section className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm dark:border-slate-800 dark:bg-slate-900">
      <div className="flex flex-col gap-6 lg:flex-row lg:items-center lg:justify-between">
        <div>
          <p className="text-sm font-medium text-slate-500 dark:text-slate-400">
            Relógio de ponto
          </p>

          <h2 className="mt-2 text-4xl font-bold tracking-tight sm:text-5xl">
            {horaAtual}
          </h2>

          <p className="mt-3 text-sm text-slate-600 dark:text-slate-300">
            Expediente previsto:{" "}
            <span className="font-semibold">{jornada.expediente}</span>
          </p>

          <p className="mt-1 text-sm text-slate-600 dark:text-slate-300">
            Data de referência:{" "}
            <span className="font-semibold">{jornada.data}</span>
          </p>
        </div>

        <div className="flex flex-col gap-3">
          <button
            type="button"
            onClick={handleRegistrarPonto}
            className="rounded-2xl bg-slate-950 px-6 py-3 text-sm font-semibold text-white shadow-sm transition hover:bg-slate-800 focus:outline-none focus:ring-2 focus:ring-slate-500 focus:ring-offset-2 dark:bg-white dark:text-slate-950 dark:hover:bg-slate-200"
          >
            Registrar ponto
          </button>

          <button
            type="button"
            className="rounded-2xl border border-slate-300 px-6 py-3 text-sm font-semibold text-slate-700 transition hover:bg-slate-100 dark:border-slate-700 dark:text-slate-200 dark:hover:bg-slate-800"
          >
            Solicitar ajuste
          </button>
        </div>
      </div>

      {mensagem && (
        <div className="mt-5 rounded-2xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-sm font-medium text-emerald-800 dark:border-emerald-900 dark:bg-emerald-950 dark:text-emerald-200">
          {mensagem}
        </div>
      )}
    </section>
  );
}
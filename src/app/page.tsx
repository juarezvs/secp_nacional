// app/login/page.tsx

"use client";

import {
  Eye,
  HelpCircle,
  Lock,
  Moon,
  ShieldCheck,
  Sun,
  User,
} from "lucide-react";

export default function LoginPage() {
  return (
    <main className="min-h-screen bg-[#F5F7F8] dark:bg-[#020817] p-8 lg:p-8">
      <div className="mx-auto flex min-h-[calc(100vh-2rem)] max-w-450 overflow-hidden rounded-4xl border border-zinc-200 dark:border-zinc-800 bg-white dark:bg-[#020817] shadow-2xl">
        {/* LEFT SIDE */}
        <section className="relative hidden w-[42%] overflow-hidden bg-linear-to-br from-[#013220] via-[#014421] to-[#016630] lg:flex">
          {/* EFFECT */}
          <div className="absolute inset-0 bg-[radial-gradient(circle_at_top,rgba(34,197,94,0.18),transparent_40%)]" />

          {/* CONTENT */}
          <div className="relative z-10 flex h-full flex-col justify-between p-10 text-white">
            {/* TOP */}
            <div>
              <div className="flex items-center gap-5">
                <div className="flex h-20 w-20 items-center justify-center rounded-3xl bg-white/10 backdrop-blur-xl">
                  <ShieldCheck size={42} />
                </div>

                <div>
                  <h1 className="text-6xl font-black tracking-tight">
                    SECP
                  </h1>
              
                    

                  <p className="mt-2 text-xl text-white/80">
                    Sistema Eletrônico de Controle de Ponto
                  </p>
                </div>
              </div>

              <div className="mt-1 max-w-xl">
                <div className="mb-8 h-1 w-20 rounded-full bg-emerald-400" />

                <h2 className="text-4xl font-bold leading-tight">
                  Plataforma integrada para gestão de frequência,
                  jornadas e banco de horas.
                </h2>

                <p className="mt-3 text-lg leading-8 text-white/75">
                  Solução institucional moderna, segura e aderente às
                  normas da Justiça Federal.
                </p>
              </div>

              {/* FEATURES */}
              <div className="mt-5 space-y-6">
                {[
                  {
                    title:
                      "Conforme Portaria SGP/SEDGG/ME nº 8.678/2021",
                    subtitle: "Controle de ponto eletrônico",
                  },
                  {
                    title: "Segurança e conformidade",
                    subtitle:
                      "Dados protegidos e auditáveis",
                  },
                  {
                    title: "Gestão completa",
                    subtitle:
                      "Jornadas, justificativas e relatórios",
                  },
                ].map((item) => (
                  <div
                    key={item.title}
                    className="flex items-start gap-4 rounded-2xl border border-white/10 bg-white/5 p-5 backdrop-blur-xl"
                  >
                    <div className="flex h-12 w-12 items-center justify-center rounded-2xl bg-emerald-500/20">
                      <ShieldCheck
                        className="text-emerald-300"
                        size={24}
                      />
                    </div>

                    <div>
                      <div className="font-semibold">
                        {item.title}
                      </div>

                      <div className="mt-1 text-white/70">
                        {item.subtitle}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* FOOTER */}
            <div className="border-t border-white/10 pt-16">
              <div className="flex items-center gap-4">
                <div className="h-6  w-14 rounded-2xl bg-white/10" />

                <div>
                  <div className="font-semibold">
                    Justiça Federal
                  </div>

                  <div className="text-sm text-white/70">
                    Tribunal Regional Federal da 1ª Região
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* RIGHT SIDE */}
        <section className="flex flex-1 flex-col">
          {/* TOPBAR */}
          <div className="flex items-center justify-end border-b border-zinc-200 dark:border-zinc-800 px-6 py-5">
            <div className="flex items-center gap-6 text-sm">
              <button className="flex items-center gap-2 text-zinc-600 transition-all hover:text-zinc-900 dark:text-zinc-300 dark:hover:text-white">
                <Sun size={18} />
                Claro
              </button>

              <button className="flex items-center gap-2 text-zinc-600 transition-all hover:text-zinc-900 dark:text-zinc-300 dark:hover:text-white">
                <Moon size={18} />
                Escuro
              </button>

              <button className="flex items-center gap-2 text-zinc-600 transition-all hover:text-zinc-900 dark:text-zinc-300 dark:hover:text-white">
                <HelpCircle size={18} />
                Ajuda
              </button>
            </div>
          </div>

          {/* CONTENT */}
          <div className="flex flex-1 items-center justify-center px-6 py-12 lg:px-16">
            <div className="w-full max-w-2xl">
              {/* TITLE */}
              <div>
                <h1 className="text-5xl font-black tracking-tight text-zinc-900 dark:text-white">
                  Acesse sua conta
                </h1>

                <p className="mt-4 text-lg text-zinc-500 dark:text-zinc-400">
                  Informe suas credenciais para acessar o sistema.
                </p>
              </div>

              {/* FORM */}
              <div className="mt-7 space-y-8">
                {/* USER */}
                <div>
                  <label className="mb-3 block text-lg font-semibold text-zinc-900 dark:text-white">
                    Usuário
                  </label>

                  <div className="relative">
                    <User
                      className="absolute left-4 top-1/2 -translate-y-1/2 text-zinc-400"
                      size={20}
                    />

                    <input
                      type="text"
                      placeholder="Digite seu usuário"
                      className="h-16 w-full rounded-2xl border border-zinc-200 dark:border-zinc-700 bg-white dark:bg-[#0F172A] pl-14 pr-4 text-lg outline-none transition-all focus:border-emerald-500 dark:text-white"
                    />
                  </div>
                </div>

                {/* PASSWORD */}
                <div>
                  <label className="mb-3 block text-lg font-semibold text-zinc-900 dark:text-white">
                    Senha
                  </label>

                  <div className="relative">
                    <Lock
                      className="absolute left-4 top-1/2 -translate-y-1/2 text-zinc-400"
                      size={20}
                    />

                    <input
                      type="password"
                      placeholder="Digite sua senha"
                      className="h-16 w-full rounded-2xl border border-zinc-200 dark:border-zinc-700 bg-white dark:bg-[#0F172A] pl-14 pr-14 text-lg outline-none transition-all focus:border-emerald-500 dark:text-white"
                    />

                    <button className="absolute right-4 top-1/2 -translate-y-1/2">
                      <Eye
                        className="text-zinc-400"
                        size={20}
                      />
                    </button>
                  </div>
                </div>

                {/* OPTIONS */}
                <div className="flex items-center justify-between">
                  <label className="flex items-center gap-3 text-base text-zinc-600 dark:text-zinc-400">
                    <input
                      type="checkbox"
                      className="h-5 w-5 rounded border-zinc-300"
                    />

                    Lembrar meu acesso
                  </label>

                  <button className="font-medium text-emerald-700 transition-all hover:text-emerald-800 dark:text-emerald-400">
                    Esqueceu sua senha?
                  </button>
                </div>

                {/* LOGIN BUTTON */}
                <button className="flex h-16 w-full items-center justify-center gap-3 rounded-2xl bg-[#016630] text-xl font-semibold text-white transition-all hover:bg-[#014421] dark:bg-emerald-600 dark:hover:bg-emerald-700">
                  <Lock size={20} />
                  Entrar no sistema
                </button>

                {/* DIVIDER */}
                <div className="flex items-center gap-4">
                  <div className="h-px flex-1 bg-zinc-200 dark:bg-zinc-800" />

                  <span className="text-sm text-zinc-400">
                    ou acesse com
                  </span>

                  <div className="h-px flex-1 bg-zinc-200 dark:bg-zinc-800" />
                </div>

                {/* GOV BR */}
                <button className="flex h-16 w-full items-center justify-center gap-4 rounded-2xl border border-zinc-200 dark:border-zinc-700 bg-white dark:bg-[#0F172A] transition-all hover:border-emerald-500">
                  <div className="text-2xl font-black text-[#1351B4]">
                    gov.br
                  </div>

                  <span className="text-lg font-medium text-zinc-900 dark:text-white">
                    Entrar com gov.br
                  </span>
                </button>
              </div>

              {/* FOOTER */}
              <div className="mt-4 flex items-center justify-between border-t border-zinc-200 dark:border-zinc-800 pt-8">
                <div className="flex items-center gap-3 text-zinc-600 dark:text-zinc-400">
                  <ShieldCheck size={20} />

                  <div>
                    <div className="font-semibold">
                      Ambiente seguro
                    </div>

                    <div className="text-sm">
                      Seus dados estão protegidos
                    </div>
                  </div>
                </div>

                <div className="text-sm text-zinc-500 dark:text-zinc-400">
                  v2.1.0
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </main>
  );
}
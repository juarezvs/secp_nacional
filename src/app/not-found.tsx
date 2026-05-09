import Link from "next/link";

export default function NotFound() {
  return (
    <main className="min-h-screen bg-slate-950 text-white flex items-center justify-center px-6">
      <section className="w-full max-w-2xl rounded-3xl border border-white/10 bg-white/[0.04] p-8 shadow-2xl backdrop-blur">
        <div className="mb-8">
          <div className="mb-4 inline-flex h-14 w-14 items-center justify-center rounded-2xl bg-red-500/10 text-red-300 ring-1 ring-red-400/20">
            <span className="text-2xl font-bold">404</span>
          </div>

          <h1 className="text-3xl font-bold tracking-tight text-white sm:text-4xl">
            Página não encontrada
          </h1>

          <p className="mt-4 text-base leading-7 text-slate-300">
            A página solicitada não existe, foi removida ou você não possui
            permissão para acessá-la no SECP.
          </p>
        </div>

        <div className="rounded-2xl border border-white/10 bg-slate-900/70 p-5">
          <h2 className="text-sm font-semibold uppercase tracking-wide text-slate-400">
            O que você pode fazer agora
          </h2>

          <ul className="mt-4 space-y-3 text-sm text-slate-300">
            <li>• Verificar se o endereço digitado está correto.</li>
            <li>• Retornar para a tela inicial do sistema.</li>
            <li>• Acessar novamente pela tela de login institucional.</li>
          </ul>
        </div>

        <div className="mt-8 flex flex-col gap-3 sm:flex-row">
          <Link
            href="/"
            className="inline-flex items-center justify-center rounded-xl bg-white px-5 py-3 text-sm font-semibold text-slate-950 transition hover:bg-slate-200 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-slate-950"
          >
            Voltar ao início
          </Link>

          <Link
            href="/login"
            className="inline-flex items-center justify-center rounded-xl border border-white/15 px-5 py-3 text-sm font-semibold text-white transition hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-slate-950"
          >
            Ir para o login
          </Link>
        </div>

        <p className="mt-8 text-xs text-slate-500">
          SECP — Sistema Eletrônico de Controle de Ponto
        </p>
      </section>
    </main>
  );
}
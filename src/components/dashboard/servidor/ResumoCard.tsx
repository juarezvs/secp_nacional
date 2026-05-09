// src/features/servidor/dashboard/components/ResumoCard.tsx

interface ResumoCardProps {
  title: string;
  value: string;
  description: string;
  status: string;
}

export function ResumoCard({
  title,
  value,
  description,
  status,
}: ResumoCardProps) {
  return (
    <article className="rounded-3xl border border-slate-200 bg-white p-5 shadow-sm transition hover:shadow-md dark:border-slate-800 dark:bg-slate-900">
      <div className="flex items-start justify-between gap-3">
        <div>
          <p className="text-sm font-medium text-slate-500 dark:text-slate-400">
            {title}
          </p>

          <p className="mt-3 text-3xl font-bold tracking-tight">{value}</p>
        </div>

        <span className="rounded-full bg-slate-100 px-3 py-1 text-xs font-semibold text-slate-700 dark:bg-slate-800 dark:text-slate-300">
          {status}
        </span>
      </div>

      <p className="mt-4 text-sm text-slate-500 dark:text-slate-400">
        {description}
      </p>
    </article>
  );
}
// components/forms/form-section.tsx

interface FormSectionProps {
  title: string;
  children: React.ReactNode;
}

export function FormSection({
  title,
  children,
}: FormSectionProps) {
  return (
    <section className="rounded-3xl bg-white border p-6">
      <h2 className="text-xl font-semibold mb-6">
        {title}
      </h2>

      {children}
    </section>
  );
}
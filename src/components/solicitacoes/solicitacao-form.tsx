// components/solicitacoes/solicitacao-form.tsx

export function SolicitacaoForm() {
  return (
    <form className="space-y-6">
      <FormSection title="Informações da solicitação">
        <FormGrid columns={2}>
          <SelectInput />

          <DateInput />

          <TextareaInput />
        </FormGrid>
      </FormSection>

      <FormSection title="Anexos">
        <UploadInput />
      </FormSection>

      <FormActions />
    </form>
  );
}
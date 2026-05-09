// src/features/servidor/dashboard/types.ts

export type StatusPonto =
  | "REGULAR"
  | "INCOMPLETO"
  | "PENDENTE"
  | "AUSENTE"
  | "EM_ANDAMENTO";

export type TipoSolicitacao =
  | "ABONO"
  | "AJUSTE_PONTO"
  | "FOLGA"
  | "JUSTIFICATIVA"
  | "COMPENSACAO";

export type StatusSolicitacao =
  | "PENDENTE"
  | "APROVADA"
  | "REJEITADA"
  | "CANCELADA";

export interface ServidorResumo {
  nome: string;
  matricula: string;
  cargo: string;
  unidade: string;
  gestor: string;
}

export interface JornadaHoje {
  data: string;
  expediente: string;
  entrada?: string;
  saidaIntervalo?: string;
  retornoIntervalo?: string;
  saida?: string;
  status: StatusPonto;
  cargaHoraria: string;
  horasTrabalhadas: string;
}

export interface SaldoBancoHoras {
  saldoAtual: string;
  saldoMes: string;
  atrasosMes: string;
  faltasMes: number;
}

export interface SolicitacaoRecente {
  id: string;
  tipo: TipoSolicitacao;
  descricao: string;
  data: string;
  status: StatusSolicitacao;
}

export interface PendenciaServidor {
  id: string;
  titulo: string;
  descricao: string;
  prioridade: "BAIXA" | "MEDIA" | "ALTA";
}

export interface HistoricoSemanaItem {
  dia: string;
  data: string;
  entrada?: string;
  saida?: string;
  horas: string;
  status: StatusPonto;
}

export interface ServidorDashboardData {
  servidor: ServidorResumo;
  jornadaHoje: JornadaHoje;
  bancoHoras: SaldoBancoHoras;
  solicitacoesRecentes: SolicitacaoRecente[];
  pendencias: PendenciaServidor[];
  historicoSemana: HistoricoSemanaItem[];
}
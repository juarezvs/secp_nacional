// src/features/servidor/dashboard/data.ts

import { ServidorDashboardData } from "./types";

export const servidorDashboardMock: ServidorDashboardData = {
  servidor: {
    nome: "Juarez de Vasconcelos da Silva",
    matricula: "AM200401",
    cargo: "Técnico Judiciário - Tecnologia da Informação",
    unidade: "NUTEC / SJAM",
    gestor: "Direção do Núcleo de Tecnologia",
  },

  jornadaHoje: {
    data: "09/05/2026",
    expediente: "08:00 às 15:00",
    entrada: "08:03",
    saidaIntervalo: "12:00",
    retornoIntervalo: "12:30",
    saida: undefined,
    status: "EM_ANDAMENTO",
    cargaHoraria: "7h",
    horasTrabalhadas: "4h27min",
  },

  bancoHoras: {
    saldoAtual: "+ 02h15min",
    saldoMes: "+ 01h05min",
    atrasosMes: "00h12min",
    faltasMes: 0,
  },

  solicitacoesRecentes: [
    {
      id: "1",
      tipo: "AJUSTE_PONTO",
      descricao: "Correção da saída do dia 06/05/2026",
      data: "07/05/2026",
      status: "PENDENTE",
    },
    {
      id: "2",
      tipo: "ABONO",
      descricao: "Justificativa de ausência parcial",
      data: "04/05/2026",
      status: "APROVADA",
    },
    {
      id: "3",
      tipo: "FOLGA",
      descricao: "Solicitação de folga compensatória",
      data: "02/05/2026",
      status: "APROVADA",
    },
  ],

  pendencias: [
    {
      id: "1",
      titulo: "Registro de ponto em andamento",
      descricao: "Ainda não foi registrada a saída do expediente de hoje.",
      prioridade: "MEDIA",
    },
    {
      id: "2",
      titulo: "Fechamento mensal próximo",
      descricao: "Confira seus registros antes do encerramento do mês.",
      prioridade: "BAIXA",
    },
  ],

  historicoSemana: [
    {
      dia: "Segunda",
      data: "04/05",
      entrada: "08:01",
      saida: "15:05",
      horas: "7h04min",
      status: "REGULAR",
    },
    {
      dia: "Terça",
      data: "05/05",
      entrada: "08:10",
      saida: "15:00",
      horas: "6h50min",
      status: "REGULAR",
    },
    {
      dia: "Quarta",
      data: "06/05",
      entrada: "08:00",
      saida: "—",
      horas: "Pendente",
      status: "INCOMPLETO",
    },
    {
      dia: "Quinta",
      data: "07/05",
      entrada: "07:58",
      saida: "15:03",
      horas: "7h05min",
      status: "REGULAR",
    },
    {
      dia: "Sexta",
      data: "08/05",
      entrada: "08:04",
      saida: "15:01",
      horas: "6h57min",
      status: "REGULAR",
    },
  ],
};
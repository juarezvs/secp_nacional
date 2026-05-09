-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "audit";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "auth";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "importacao";

-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "secp";

-- CreateExtension
CREATE EXTENSION IF NOT EXISTS "citext";

-- CreateExtension
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- CreateExtension
CREATE EXTENSION IF NOT EXISTS "vector";

-- CreateExtension
CREATE EXTENSION IF NOT EXISTS "unaccent";

-- CreateExtension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CreateEnum
CREATE TYPE "secp"."StatusRegistro" AS ENUM ('ATIVO', 'INATIVO', 'BLOQUEADO', 'ARQUIVADO');

-- CreateEnum
CREATE TYPE "secp"."StatusTenant" AS ENUM ('EM_IMPLANTACAO', 'ATIVO', 'SUSPENSO', 'BLOQUEADO', 'ENCERRADO');

-- CreateEnum
CREATE TYPE "secp"."TipoTenant" AS ENUM ('PLATAFORMA', 'CONSELHO', 'TRIBUNAL', 'SECAO_JUDICIARIA', 'SUBSECAO_JUDICIARIA', 'ORGAO_EXTERNO');

-- CreateEnum
CREATE TYPE "auth"."PerfilGlobal" AS ENUM ('MASTER', 'SUPORTE_PLATAFORMA', 'AUDITOR_GERAL');

-- CreateEnum
CREATE TYPE "secp"."PerfilTenant" AS ENUM ('ADMINISTRADOR', 'GESTOR', 'SERVIDOR', 'RH', 'AUDITOR', 'OPERADOR_AFD', 'SUPORTE_TECNICO');

-- CreateEnum
CREATE TYPE "secp"."StatusVinculoUsuario" AS ENUM ('PENDENTE', 'ATIVO', 'SUSPENSO', 'BLOQUEADO', 'REVOGADO');

-- CreateEnum
CREATE TYPE "secp"."TipoAuthProviderTenant" AS ENUM ('CREDENTIALS_LOCAL', 'LDAP_ACTIVE_DIRECTORY', 'GOV_BR', 'CERTIFICADO_DIGITAL', 'GOOGLE', 'APPLE', 'MICROSOFT_ENTRA_ID');

-- CreateEnum
CREATE TYPE "secp"."TipoDocumentoIdentificacao" AS ENUM ('CPF', 'RG', 'CNH', 'PASSAPORTE', 'CERTIDAO', 'OUTRO');

-- CreateEnum
CREATE TYPE "secp"."TipoUnidadeOrganizacional" AS ENUM ('CJF', 'TRF', 'SECAO_JUDICIARIA', 'SUBSECAO_JUDICIARIA', 'DIRETORIA_FORO', 'SECRETARIA', 'NUCLEO', 'SECAO', 'SETOR', 'VARA_FEDERAL', 'TURMA_RECURSAL', 'GABINETE', 'CENTRO_JUDICIARIO', 'UNIDADE_ADMINISTRATIVA', 'UNIDADE_JUDICIAL', 'OUTRA');

-- CreateEnum
CREATE TYPE "secp"."NaturezaUnidade" AS ENUM ('ADMINISTRATIVA', 'JUDICIAL', 'MISTA');

-- CreateEnum
CREATE TYPE "secp"."StatusServidor" AS ENUM ('ATIVO', 'AFASTADO', 'CEDIDO', 'REMOVIDO', 'REDISTRIBUIDO', 'APOSENTADO', 'DESLIGADO', 'BLOQUEADO');

-- CreateEnum
CREATE TYPE "secp"."TipoVinculoServidor" AS ENUM ('SERVIDOR_EFETIVO', 'SERVIDOR_REQUISITADO', 'CEDIDO', 'COMISSIONADO', 'ESTAGIARIO', 'TERCEIRIZADO', 'MAGISTRADO', 'COLABORADOR');

-- CreateEnum
CREATE TYPE "secp"."TipoChefia" AS ENUM ('TITULAR', 'SUBSTITUTO', 'TEMPORARIO', 'RECESSO_FORENSE', 'DELEGADO');

-- CreateEnum
CREATE TYPE "secp"."DiaSemana" AS ENUM ('DOMINGO', 'SEGUNDA', 'TERCA', 'QUARTA', 'QUINTA', 'SEXTA', 'SABADO');

-- CreateEnum
CREATE TYPE "secp"."TipoFeriado" AS ENUM ('NACIONAL', 'ESTADUAL', 'MUNICIPAL', 'JUDICIARIO', 'PONTO_FACULTATIVO', 'RECESSO_FORENSE', 'SUSPENSAO_EXPEDIENTE', 'OUTRO');

-- CreateEnum
CREATE TYPE "secp"."TipoDispositivoPonto" AS ENUM ('TOTEM', 'WEB', 'MOBILE', 'API', 'IMPORTACAO_AFD', 'AJUSTE_MANUAL');

-- CreateEnum
CREATE TYPE "secp"."TipoMarcacaoPonto" AS ENUM ('ENTRADA', 'SAIDA', 'INICIO_INTERVALO', 'FIM_INTERVALO', 'ENTRADA_EXTRA', 'SAIDA_EXTRA', 'AJUSTE');

-- CreateEnum
CREATE TYPE "secp"."OrigemRegistroPonto" AS ENUM ('BIOMETRIA_FACIAL', 'CERTIFICADO_DIGITAL', 'GOV_BR', 'LOGIN_SENHA', 'AFD', 'API', 'ADMINISTRATIVO');

-- CreateEnum
CREATE TYPE "secp"."StatusRegistroPonto" AS ENUM ('VALIDO', 'PENDENTE_VALIDACAO', 'SUSPEITO', 'INVALIDADO', 'CANCELADO', 'SUBSTITUIDO');

-- CreateEnum
CREATE TYPE "secp"."StatusDiaPonto" AS ENUM ('REGULAR', 'INCOMPLETO', 'AUSENCIA', 'ATRASO', 'SAIDA_ANTECIPADA', 'HORAS_EXCEDENTES', 'FERIADO', 'RECESSO', 'AFASTAMENTO', 'PENDENTE_AJUSTE', 'PENDENTE_APROVACAO');

-- CreateEnum
CREATE TYPE "secp"."TipoOcorrenciaPonto" AS ENUM ('ATRASO', 'SAIDA_ANTECIPADA', 'AUSENCIA', 'MARCACAO_IMPAR', 'MARCACAO_DUPLICADA', 'SEM_INTERVALO', 'EXCESSO_JORNADA', 'BANCO_HORAS', 'PLANTAO', 'TELETRABALHO', 'AFASTAMENTO', 'OUTRO');

-- CreateEnum
CREATE TYPE "secp"."StatusSolicitacao" AS ENUM ('RASCUNHO', 'ENVIADA', 'EM_ANALISE', 'APROVADA', 'REJEITADA', 'CANCELADA', 'DEVOLVIDA');

-- CreateEnum
CREATE TYPE "secp"."TipoSolicitacaoPonto" AS ENUM ('INCLUSAO_MARCACAO', 'ALTERACAO_MARCACAO', 'EXCLUSAO_MARCACAO', 'JUSTIFICATIVA_AUSENCIA', 'JUSTIFICATIVA_ATRASO', 'ABONO', 'COMPENSACAO', 'BANCO_HORAS');

-- CreateEnum
CREATE TYPE "secp"."StatusFechamento" AS ENUM ('ABERTO', 'EM_PROCESSAMENTO', 'PENDENTE_SERVIDOR', 'PENDENTE_CHEFIA', 'APROVADO_CHEFIA', 'HOMOLOGADO_RH', 'REABERTO', 'CANCELADO');

-- CreateEnum
CREATE TYPE "secp"."TipoFechamento" AS ENUM ('MENSAL_ORDINARIO', 'DEZEMBRO_ORDINARIO_ATE_19', 'RECESSO_DEZEMBRO', 'RECESSO_JANEIRO', 'JANEIRO_ORDINARIO_APOS_06', 'EXTRAORDINARIO');

-- CreateEnum
CREATE TYPE "importacao"."StatusImportacaoAfd" AS ENUM ('RECEBIDO', 'ENFILEIRADO', 'PROCESSANDO', 'PROCESSADO', 'PROCESSADO_COM_ALERTAS', 'FALHOU', 'CANCELADO');

-- CreateEnum
CREATE TYPE "importacao"."StatusLinhaAfd" AS ENUM ('PENDENTE', 'PROCESSADA', 'IGNORADA', 'DUPLICADA', 'ERRO');

-- CreateEnum
CREATE TYPE "importacao"."TipoLinhaAfd" AS ENUM ('CABECALHO', 'IDENTIFICACAO_EMPREGADOR', 'MARCACAO_PONTO', 'AJUSTE_RELOGIO', 'INCLUSAO_ALTERACAO_EMPREGADO', 'EVENTO_SENSIVEL', 'TRAILER', 'DESCONHECIDA');

-- CreateEnum
CREATE TYPE "secp"."TipoCompensacaoRecesso" AS ENUM ('PECUNIA', 'FOLGA_COMPENSATORIA', 'BANCO_HORAS', 'NAO_DEFINIDA');

-- CreateEnum
CREATE TYPE "secp"."StatusRecesso" AS ENUM ('PLANEJADO', 'ABERTO', 'EM_EXECUCAO', 'ENCERRADO', 'HOMOLOGADO', 'CANCELADO');

-- CreateEnum
CREATE TYPE "secp"."TipoCanalNotificacao" AS ENUM ('SISTEMA', 'EMAIL', 'PUSH', 'WHATSAPP', 'WEBHOOK');

-- CreateEnum
CREATE TYPE "secp"."StatusNotificacao" AS ENUM ('PENDENTE', 'ENVIADA', 'LIDA', 'FALHOU', 'CANCELADA');

-- CreateEnum
CREATE TYPE "audit"."SeveridadeAuditoria" AS ENUM ('INFO', 'WARNING', 'ERROR', 'SECURITY', 'CRITICAL');

-- CreateEnum
CREATE TYPE "secp"."TipoEventoOutbox" AS ENUM ('DOMAIN_EVENT', 'INTEGRATION_EVENT', 'NOTIFICATION_EVENT', 'AUDIT_EVENT');

-- CreateEnum
CREATE TYPE "secp"."StatusOutbox" AS ENUM ('PENDING', 'PROCESSING', 'PUBLISHED', 'FAILED', 'CANCELLED');

-- CreateTable
CREATE TABLE "auth"."User" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(255),
    "email" CITEXT,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,
    "username" CITEXT,
    "cpfHash" VARCHAR(128),
    "matricula" VARCHAR(50),
    "telefone" VARCHAR(30),
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "bloqueadoAte" TIMESTAMP(3),
    "ultimoLoginEm" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth"."Account" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth"."Session" (
    "id" TEXT NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth"."VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "auth"."Authenticator" (
    "credentialID" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "credentialPublicKey" TEXT NOT NULL,
    "counter" INTEGER NOT NULL,
    "credentialDeviceType" TEXT NOT NULL,
    "credentialBackedUp" BOOLEAN NOT NULL,
    "transports" TEXT,

    CONSTRAINT "Authenticator_pkey" PRIMARY KEY ("userId","credentialID")
);

-- CreateTable
CREATE TABLE "auth"."UserGlobalRole" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "perfil" "auth"."PerfilGlobal" NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "grantedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),
    "grantedBy" TEXT,
    "motivo" TEXT,

    CONSTRAINT "UserGlobalRole_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth"."IdentidadeExterna" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "tenantId" TEXT,
    "provider" "secp"."TipoAuthProviderTenant" NOT NULL,
    "externalId" VARCHAR(255) NOT NULL,
    "username" CITEXT,
    "ldapDn" TEXT,
    "metadata" JSONB,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "lastUsedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IdentidadeExterna_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth"."CertificadoDigitalVinculo" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "tenantId" TEXT,
    "subject" TEXT NOT NULL,
    "issuer" TEXT NOT NULL,
    "serialNumberHash" VARCHAR(128) NOT NULL,
    "thumbprintHash" VARCHAR(128) NOT NULL,
    "cpfHash" VARCHAR(128),
    "validFrom" TIMESTAMP(3),
    "validTo" TIMESTAMP(3),
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "revogadoEm" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CertificadoDigitalVinculo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."Tenant" (
    "id" TEXT NOT NULL,
    "codigo" VARCHAR(50) NOT NULL,
    "slug" CITEXT NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "nomeFantasia" VARCHAR(255),
    "sigla" VARCHAR(30) NOT NULL,
    "cnpjHash" VARCHAR(128),
    "tipo" "secp"."TipoTenant" NOT NULL DEFAULT 'SECAO_JUDICIARIA',
    "status" "secp"."StatusTenant" NOT NULL DEFAULT 'EM_IMPLANTACAO',
    "timezone" VARCHAR(80) NOT NULL DEFAULT 'America/Manaus',
    "schemaName" VARCHAR(80),
    "dominioPrincipal" CITEXT,
    "subdominio" CITEXT,
    "portariaBase" VARCHAR(120),
    "processoSei" VARCHAR(80),
    "dataImplantacao" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Tenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."TenantVisualIdentity" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "appName" VARCHAR(120) NOT NULL DEFAULT 'SECP',
    "loginTitle" VARCHAR(180),
    "loginSubtitle" VARCHAR(255),
    "logoUrl" TEXT,
    "logoDarkUrl" TEXT,
    "faviconUrl" TEXT,
    "backgroundImageUrl" TEXT,
    "primaryColor" VARCHAR(20),
    "accentColor" VARCHAR(20),
    "darkModeDefault" BOOLEAN NOT NULL DEFAULT false,
    "customCss" TEXT,
    "layoutConfig" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TenantVisualIdentity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."TenantAuthConfig" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "provider" "secp"."TipoAuthProviderTenant" NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "ordem" INTEGER NOT NULL DEFAULT 0,
    "nome" VARCHAR(120),
    "configEncrypted" JSONB,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TenantAuthConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."ParametroTenant" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "chave" VARCHAR(120) NOT NULL,
    "valor" JSONB NOT NULL,
    "descricao" TEXT,
    "sensivel" BOOLEAN NOT NULL DEFAULT false,
    "atualizadoPorUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ParametroTenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."FeatureFlagTenant" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "chave" VARCHAR(120) NOT NULL,
    "habilitado" BOOLEAN NOT NULL DEFAULT false,
    "config" JSONB,
    "descricao" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FeatureFlagTenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."PreferenciaDashboard" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "tenantId" TEXT,
    "perfil" VARCHAR(80),
    "layout" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PreferenciaDashboard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."UsuarioTenant" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "servidorId" TEXT,
    "perfil" "secp"."PerfilTenant" NOT NULL,
    "status" "secp"."StatusVinculoUsuario" NOT NULL DEFAULT 'PENDENTE',
    "isDefaultTenant" BOOLEAN NOT NULL DEFAULT false,
    "lotacaoPrincipalId" TEXT,
    "grantedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),
    "grantedByUserId" TEXT,
    "motivo" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UsuarioTenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."Permissao" (
    "id" TEXT NOT NULL,
    "codigo" VARCHAR(120) NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "modulo" VARCHAR(80) NOT NULL,
    "descricao" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Permissao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."PerfilPermissaoTenant" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "perfil" "secp"."PerfilTenant" NOT NULL,
    "permissaoId" TEXT NOT NULL,
    "permitido" BOOLEAN NOT NULL DEFAULT true,
    "restricoes" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PerfilPermissaoTenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."TipoUnidadeCatalogo" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "codigo" VARCHAR(60) NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "tipoBase" "secp"."TipoUnidadeOrganizacional" NOT NULL,
    "natureza" "secp"."NaturezaUnidade" NOT NULL DEFAULT 'ADMINISTRATIVA',
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "ordem" INTEGER NOT NULL DEFAULT 0,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TipoUnidadeCatalogo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."UnidadeOrganizacional" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "parentId" TEXT,
    "tipoCatalogoId" TEXT,
    "codigo" VARCHAR(80) NOT NULL,
    "sigla" VARCHAR(50) NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "nomeCompleto" VARCHAR(500),
    "natureza" "secp"."NaturezaUnidade" NOT NULL DEFAULT 'ADMINISTRATIVA',
    "nivel" INTEGER NOT NULL DEFAULT 0,
    "caminho" TEXT,
    "ordem" INTEGER NOT NULL DEFAULT 0,
    "ativa" BOOLEAN NOT NULL DEFAULT true,
    "permitePonto" BOOLEAN NOT NULL DEFAULT true,
    "processoSei" VARCHAR(80),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "UnidadeOrganizacional_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."UnidadeGestor" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "unidadeId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "tipo" "secp"."TipoChefia" NOT NULL DEFAULT 'TITULAR',
    "inicioEm" TIMESTAMP(3) NOT NULL,
    "fimEm" TIMESTAMP(3),
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "portaria" VARCHAR(120),
    "processoSei" VARCHAR(80),
    "observacao" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UnidadeGestor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."Cargo" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "codigo" VARCHAR(60) NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "area" VARCHAR(180),
    "especialidade" VARCHAR(180),
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Cargo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."FuncaoComissionada" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "codigo" VARCHAR(60) NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "nivel" VARCHAR(30),
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FuncaoComissionada_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."Servidor" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT,
    "matricula" VARCHAR(50) NOT NULL,
    "matriculaRh" VARCHAR(50),
    "cpfHash" VARCHAR(128) NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "nomeSocial" VARCHAR(255),
    "emailInstitucional" CITEXT,
    "telefoneInstitucional" VARCHAR(30),
    "tipoVinculo" "secp"."TipoVinculoServidor" NOT NULL DEFAULT 'SERVIDOR_EFETIVO',
    "status" "secp"."StatusServidor" NOT NULL DEFAULT 'ATIVO',
    "dataIngresso" DATE,
    "dataDesligamento" DATE,
    "cargoId" TEXT,
    "funcaoId" TEXT,
    "unidadeLotacaoId" TEXT,
    "unidadeExercicioId" TEXT,
    "permitePonto" BOOLEAN NOT NULL DEFAULT true,
    "exigeBiometria" BOOLEAN NOT NULL DEFAULT true,
    "permiteRegistroWeb" BOOLEAN NOT NULL DEFAULT true,
    "permiteRegistroMobile" BOOLEAN NOT NULL DEFAULT false,
    "cargaHorariaSemanal" INTEGER,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Servidor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."AfastamentoServidor" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "tipo" VARCHAR(120) NOT NULL,
    "descricao" TEXT,
    "inicioEm" DATE NOT NULL,
    "fimEm" DATE,
    "processoSei" VARCHAR(80),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AfastamentoServidor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."JornadaTrabalho" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "codigo" VARCHAR(80) NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "descricao" TEXT,
    "cargaSemanalMinutos" INTEGER NOT NULL,
    "cargaDiariaMinutos" INTEGER,
    "toleranciaEntradaMin" INTEGER NOT NULL DEFAULT 0,
    "toleranciaSaidaMin" INTEGER NOT NULL DEFAULT 0,
    "toleranciaIntervaloMin" INTEGER NOT NULL DEFAULT 0,
    "permiteBancoHoras" BOOLEAN NOT NULL DEFAULT false,
    "permiteTeletrabalho" BOOLEAN NOT NULL DEFAULT false,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "JornadaTrabalho_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."JornadaDia" (
    "id" TEXT NOT NULL,
    "jornadaId" TEXT NOT NULL,
    "diaSemana" "secp"."DiaSemana" NOT NULL,
    "diaUtil" BOOLEAN NOT NULL DEFAULT true,
    "entradaPrevista" TIME(0),
    "saidaPrevista" TIME(0),
    "intervaloInicio" TIME(0),
    "intervaloFim" TIME(0),
    "cargaMinutos" INTEGER NOT NULL DEFAULT 0,
    "permiteFlexivel" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB,

    CONSTRAINT "JornadaDia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."JornadaUnidade" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "unidadeId" TEXT NOT NULL,
    "jornadaId" TEXT NOT NULL,
    "inicioEm" DATE NOT NULL,
    "fimEm" DATE,
    "prioridade" INTEGER NOT NULL DEFAULT 0,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "observacao" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "JornadaUnidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."JornadaServidor" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "jornadaId" TEXT NOT NULL,
    "inicioEm" DATE NOT NULL,
    "fimEm" DATE,
    "prioridade" INTEGER NOT NULL DEFAULT 0,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "observacao" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "JornadaServidor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."Feriado" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "data" DATE NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "tipo" "secp"."TipoFeriado" NOT NULL,
    "abrangencia" VARCHAR(120),
    "unidadeId" TEXT,
    "expedienteSuspenso" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Feriado_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."RecessoForense" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "anoReferencia" INTEGER NOT NULL,
    "inicioEm" DATE NOT NULL,
    "fimEm" DATE NOT NULL,
    "status" "secp"."StatusRecesso" NOT NULL DEFAULT 'PLANEJADO',
    "portaria" VARCHAR(120),
    "processoSei" VARCHAR(80),
    "observacao" TEXT,
    "regras" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RecessoForense_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."ConvocacaoRecesso" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "recessoId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "unidadeId" TEXT,
    "inicioEm" DATE NOT NULL,
    "fimEm" DATE NOT NULL,
    "portaria" VARCHAR(120),
    "processoSei" VARCHAR(80),
    "observacao" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ConvocacaoRecesso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."DiaConvocadoRecesso" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "convocacaoId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "data" DATE NOT NULL,
    "compensacao" "secp"."TipoCompensacaoRecesso" NOT NULL DEFAULT 'NAO_DEFINIDA',
    "quantidadeMinutos" INTEGER,
    "aprovadoPorServidor" BOOLEAN NOT NULL DEFAULT false,
    "aprovadoEm" TIMESTAMP(3),
    "observacao" TEXT,
    "metadata" JSONB,

    CONSTRAINT "DiaConvocadoRecesso_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."LocalRegistroPonto" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "unidadeId" TEXT,
    "codigo" VARCHAR(80) NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "descricao" TEXT,
    "latitude" DECIMAL(10,7),
    "longitude" DECIMAL(10,7),
    "raioMetros" INTEGER,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LocalRegistroPonto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."DispositivoPonto" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "unidadeId" TEXT,
    "localId" TEXT,
    "codigo" VARCHAR(80) NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "tipo" "secp"."TipoDispositivoPonto" NOT NULL,
    "serial" VARCHAR(120),
    "fabricante" VARCHAR(120),
    "modelo" VARCHAR(120),
    "ipPermitido" VARCHAR(80),
    "chavePublica" TEXT,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "ultimoPingEm" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DispositivoPonto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."BiometriaFaceTemplate" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "versao" INTEGER NOT NULL DEFAULT 1,
    "provider" VARCHAR(120) NOT NULL DEFAULT 'vladmandic-human',
    "modelName" VARCHAR(120) NOT NULL,
    "modelVersion" VARCHAR(80),
    "embedding" vector(512),
    "embeddingHash" VARCHAR(128) NOT NULL,
    "qualidade" DECIMAL(5,2),
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "capturadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiradoEm" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BiometriaFaceTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."BiometriaFaceSample" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "templateId" TEXT,
    "objectKey" TEXT NOT NULL,
    "bucket" VARCHAR(120),
    "mimeType" VARCHAR(80),
    "tamanhoBytes" INTEGER,
    "qualidade" DECIMAL(5,2),
    "livenessScore" DECIMAL(5,2),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BiometriaFaceSample_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."RegistroPonto" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "unidadeId" TEXT,
    "dispositivoId" TEXT,
    "localId" TEXT,
    "linhaAfdId" TEXT,
    "dataHora" TIMESTAMP(3) NOT NULL,
    "dataReferencia" DATE NOT NULL,
    "tipo" "secp"."TipoMarcacaoPonto" NOT NULL,
    "origem" "secp"."OrigemRegistroPonto" NOT NULL,
    "status" "secp"."StatusRegistroPonto" NOT NULL DEFAULT 'VALIDO',
    "ip" VARCHAR(80),
    "userAgent" TEXT,
    "latitude" DECIMAL(10,7),
    "longitude" DECIMAL(10,7),
    "geoPrecisaoMetros" DECIMAL(10,2),
    "fotoObjectKey" TEXT,
    "biometriaVerificada" BOOLEAN NOT NULL DEFAULT false,
    "biometriaScore" DECIMAL(5,2),
    "certificadoThumbprintHash" VARCHAR(128),
    "hashRegistro" VARCHAR(128) NOT NULL,
    "hashAnterior" VARCHAR(128),
    "assinaturaDispositivo" TEXT,
    "observacao" TEXT,
    "metadata" JSONB,
    "criadoPorUserId" TEXT,
    "invalidadoPorUserId" TEXT,
    "invalidadoEm" TIMESTAMP(3),
    "motivoInvalidacao" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RegistroPonto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."DiaPontoResumo" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "unidadeId" TEXT,
    "data" DATE NOT NULL,
    "status" "secp"."StatusDiaPonto" NOT NULL DEFAULT 'REGULAR',
    "jornadaPrevistaMinutos" INTEGER NOT NULL DEFAULT 0,
    "trabalhadoMinutos" INTEGER NOT NULL DEFAULT 0,
    "intervaloMinutos" INTEGER NOT NULL DEFAULT 0,
    "saldoMinutos" INTEGER NOT NULL DEFAULT 0,
    "atrasoMinutos" INTEGER NOT NULL DEFAULT 0,
    "saidaAntecipadaMinutos" INTEGER NOT NULL DEFAULT 0,
    "extraMinutos" INTEGER NOT NULL DEFAULT 0,
    "registros" JSONB,
    "calculadoEm" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DiaPontoResumo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."OcorrenciaPonto" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "unidadeId" TEXT,
    "diaResumoId" TEXT,
    "registroPontoId" TEXT,
    "tipo" "secp"."TipoOcorrenciaPonto" NOT NULL,
    "status" "secp"."StatusSolicitacao" NOT NULL DEFAULT 'ENVIADA',
    "dataReferencia" DATE NOT NULL,
    "descricao" TEXT,
    "minutos" INTEGER,
    "justificativa" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OcorrenciaPonto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."SolicitacaoPonto" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "unidadeId" TEXT,
    "tipo" "secp"."TipoSolicitacaoPonto" NOT NULL,
    "status" "secp"."StatusSolicitacao" NOT NULL DEFAULT 'RASCUNHO',
    "dataReferencia" DATE NOT NULL,
    "descricao" TEXT NOT NULL,
    "payload" JSONB,
    "analisadoPorId" TEXT,
    "analisadoEm" TIMESTAMP(3),
    "decisao" TEXT,
    "processoSei" VARCHAR(80),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SolicitacaoPonto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."AprovacaoSolicitacao" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "solicitacaoId" TEXT NOT NULL,
    "aprovadorId" TEXT NOT NULL,
    "status" "secp"."StatusSolicitacao" NOT NULL,
    "comentario" TEXT,
    "nivel" INTEGER NOT NULL DEFAULT 1,
    "decididoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,

    CONSTRAINT "AprovacaoSolicitacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."FechamentoMensal" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "unidadeId" TEXT NOT NULL,
    "chefiaId" TEXT,
    "recessoId" TEXT,
    "ano" INTEGER NOT NULL,
    "mes" INTEGER NOT NULL,
    "competencia" VARCHAR(7) NOT NULL,
    "tipo" "secp"."TipoFechamento" NOT NULL DEFAULT 'MENSAL_ORDINARIO',
    "periodoInicio" DATE NOT NULL,
    "periodoFim" DATE NOT NULL,
    "status" "secp"."StatusFechamento" NOT NULL DEFAULT 'ABERTO',
    "totalServidores" INTEGER NOT NULL DEFAULT 0,
    "totalPendencias" INTEGER NOT NULL DEFAULT 0,
    "fechadoEm" TIMESTAMP(3),
    "aprovadoChefiaEm" TIMESTAMP(3),
    "homologadoRhEm" TIMESTAMP(3),
    "observacao" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FechamentoMensal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."FechamentoServidor" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "fechamentoId" TEXT NOT NULL,
    "servidorId" TEXT NOT NULL,
    "jornadaId" TEXT,
    "status" "secp"."StatusFechamento" NOT NULL DEFAULT 'ABERTO',
    "diasUteis" INTEGER NOT NULL DEFAULT 0,
    "diasTrabalhados" INTEGER NOT NULL DEFAULT 0,
    "faltas" INTEGER NOT NULL DEFAULT 0,
    "atrasosMinutos" INTEGER NOT NULL DEFAULT 0,
    "saidasAntecipadasMinutos" INTEGER NOT NULL DEFAULT 0,
    "trabalhadoMinutos" INTEGER NOT NULL DEFAULT 0,
    "previstoMinutos" INTEGER NOT NULL DEFAULT 0,
    "saldoMinutos" INTEGER NOT NULL DEFAULT 0,
    "bancoHorasMinutos" INTEGER NOT NULL DEFAULT 0,
    "pendencias" INTEGER NOT NULL DEFAULT 0,
    "cienciaServidorEm" TIMESTAMP(3),
    "aprovadoChefiaEm" TIMESTAMP(3),
    "homologadoRhEm" TIMESTAMP(3),
    "resumo" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FechamentoServidor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "importacao"."ImportacaoAfd" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "unidadeId" TEXT,
    "dispositivoId" TEXT,
    "originalName" VARCHAR(255) NOT NULL,
    "objectKey" TEXT NOT NULL,
    "bucket" VARCHAR(120),
    "mimeType" VARCHAR(80),
    "tamanhoBytes" INTEGER,
    "checksumSha256" VARCHAR(128) NOT NULL,
    "status" "importacao"."StatusImportacaoAfd" NOT NULL DEFAULT 'RECEBIDO',
    "linhasTotal" INTEGER NOT NULL DEFAULT 0,
    "linhasProcessadas" INTEGER NOT NULL DEFAULT 0,
    "linhasErro" INTEGER NOT NULL DEFAULT 0,
    "iniciadoEm" TIMESTAMP(3),
    "finalizadoEm" TIMESTAMP(3),
    "erro" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ImportacaoAfd_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "importacao"."LinhaAfd" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "importacaoId" TEXT NOT NULL,
    "nsr" INTEGER,
    "tipoLinha" "importacao"."TipoLinhaAfd" NOT NULL,
    "status" "importacao"."StatusLinhaAfd" NOT NULL DEFAULT 'PENDENTE',
    "numeroLinha" INTEGER NOT NULL,
    "dataHora" TIMESTAMP(3),
    "cpfHash" VARCHAR(128),
    "pisPasepHash" VARCHAR(128),
    "matricula" VARCHAR(50),
    "serialEquipamento" VARCHAR(120),
    "rawLine" TEXT NOT NULL,
    "parsedJson" JSONB,
    "erro" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LinhaAfd_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."ArquivoAnexo" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "solicitacaoId" TEXT,
    "nomeOriginal" VARCHAR(255) NOT NULL,
    "objectKey" TEXT NOT NULL,
    "bucket" VARCHAR(120) NOT NULL,
    "mimeType" VARCHAR(80),
    "tamanhoBytes" INTEGER,
    "checksumSha256" VARCHAR(128),
    "criadoPorUserId" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ArquivoAnexo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."Notificacao" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "userId" TEXT,
    "servidorId" TEXT,
    "canal" "secp"."TipoCanalNotificacao" NOT NULL,
    "status" "secp"."StatusNotificacao" NOT NULL DEFAULT 'PENDENTE',
    "assunto" VARCHAR(180) NOT NULL,
    "mensagem" TEXT NOT NULL,
    "payload" JSONB,
    "scheduledAt" TIMESTAMP(3),
    "sentAt" TIMESTAMP(3),
    "readAt" TIMESTAMP(3),
    "erro" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Notificacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."PushSubscription" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "tenantId" TEXT,
    "endpoint" TEXT NOT NULL,
    "p256dh" TEXT NOT NULL,
    "auth" TEXT NOT NULL,
    "userAgent" TEXT,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PushSubscription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."WebhookEndpoint" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "url" TEXT NOT NULL,
    "secretHash" VARCHAR(128),
    "eventos" TEXT[],
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "ultimoEnvioEm" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WebhookEndpoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."ApiKey" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "userId" TEXT,
    "nome" VARCHAR(180) NOT NULL,
    "keyHash" VARCHAR(128) NOT NULL,
    "prefix" VARCHAR(20) NOT NULL,
    "scopes" TEXT[],
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "expiresAt" TIMESTAMP(3),
    "lastUsedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "ApiKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."IdempotencyKey" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "key" VARCHAR(180) NOT NULL,
    "requestHash" VARCHAR(128) NOT NULL,
    "response" JSONB,
    "statusCode" INTEGER,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "IdempotencyKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."OutboxEvent" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "type" "secp"."TipoEventoOutbox" NOT NULL,
    "aggregateType" VARCHAR(120) NOT NULL,
    "aggregateId" VARCHAR(120) NOT NULL,
    "eventName" VARCHAR(180) NOT NULL,
    "payload" JSONB NOT NULL,
    "headers" JSONB,
    "status" "secp"."StatusOutbox" NOT NULL DEFAULT 'PENDING',
    "attempts" INTEGER NOT NULL DEFAULT 0,
    "nextAttemptAt" TIMESTAMP(3),
    "publishedAt" TIMESTAMP(3),
    "erro" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OutboxEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "audit"."AuditoriaEvento" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "userId" TEXT,
    "servidorId" TEXT,
    "severidade" "audit"."SeveridadeAuditoria" NOT NULL DEFAULT 'INFO',
    "acao" VARCHAR(180) NOT NULL,
    "entidade" VARCHAR(120) NOT NULL,
    "entidadeId" VARCHAR(120),
    "modulo" VARCHAR(80),
    "ip" VARCHAR(80),
    "userAgent" TEXT,
    "requestId" VARCHAR(120),
    "correlationId" VARCHAR(120),
    "before" JSONB,
    "after" JSONB,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditoriaEvento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "secp"."JobProcessamento" (
    "id" TEXT NOT NULL,
    "tenantId" TEXT,
    "fila" VARCHAR(120) NOT NULL,
    "nome" VARCHAR(180) NOT NULL,
    "jobKey" VARCHAR(180),
    "payload" JSONB,
    "status" VARCHAR(40) NOT NULL DEFAULT 'PENDING',
    "attempts" INTEGER NOT NULL DEFAULT 0,
    "maxAttempts" INTEGER NOT NULL DEFAULT 3,
    "scheduledAt" TIMESTAMP(3),
    "startedAt" TIMESTAMP(3),
    "finishedAt" TIMESTAMP(3),
    "erro" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "JobProcessamento_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "auth"."User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "auth"."User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_cpfHash_key" ON "auth"."User"("cpfHash");

-- CreateIndex
CREATE INDEX "User_email_idx" ON "auth"."User"("email");

-- CreateIndex
CREATE INDEX "User_username_idx" ON "auth"."User"("username");

-- CreateIndex
CREATE INDEX "User_cpfHash_idx" ON "auth"."User"("cpfHash");

-- CreateIndex
CREATE INDEX "User_ativo_idx" ON "auth"."User"("ativo");

-- CreateIndex
CREATE INDEX "Account_userId_idx" ON "auth"."Account"("userId");

-- CreateIndex
CREATE INDEX "Account_provider_idx" ON "auth"."Account"("provider");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "auth"."Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "auth"."Session"("sessionToken");

-- CreateIndex
CREATE INDEX "Session_userId_idx" ON "auth"."Session"("userId");

-- CreateIndex
CREATE INDEX "Session_expires_idx" ON "auth"."Session"("expires");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "auth"."VerificationToken"("token");

-- CreateIndex
CREATE INDEX "VerificationToken_expires_idx" ON "auth"."VerificationToken"("expires");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "auth"."VerificationToken"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "Authenticator_credentialID_key" ON "auth"."Authenticator"("credentialID");

-- CreateIndex
CREATE INDEX "Authenticator_userId_idx" ON "auth"."Authenticator"("userId");

-- CreateIndex
CREATE INDEX "UserGlobalRole_perfil_ativo_idx" ON "auth"."UserGlobalRole"("perfil", "ativo");

-- CreateIndex
CREATE UNIQUE INDEX "UserGlobalRole_userId_perfil_key" ON "auth"."UserGlobalRole"("userId", "perfil");

-- CreateIndex
CREATE INDEX "IdentidadeExterna_userId_idx" ON "auth"."IdentidadeExterna"("userId");

-- CreateIndex
CREATE INDEX "IdentidadeExterna_tenantId_provider_idx" ON "auth"."IdentidadeExterna"("tenantId", "provider");

-- CreateIndex
CREATE UNIQUE INDEX "IdentidadeExterna_provider_externalId_tenantId_key" ON "auth"."IdentidadeExterna"("provider", "externalId", "tenantId");

-- CreateIndex
CREATE INDEX "CertificadoDigitalVinculo_userId_idx" ON "auth"."CertificadoDigitalVinculo"("userId");

-- CreateIndex
CREATE INDEX "CertificadoDigitalVinculo_cpfHash_idx" ON "auth"."CertificadoDigitalVinculo"("cpfHash");

-- CreateIndex
CREATE INDEX "CertificadoDigitalVinculo_ativo_validTo_idx" ON "auth"."CertificadoDigitalVinculo"("ativo", "validTo");

-- CreateIndex
CREATE UNIQUE INDEX "CertificadoDigitalVinculo_tenantId_serialNumberHash_key" ON "auth"."CertificadoDigitalVinculo"("tenantId", "serialNumberHash");

-- CreateIndex
CREATE UNIQUE INDEX "Tenant_codigo_key" ON "secp"."Tenant"("codigo");

-- CreateIndex
CREATE UNIQUE INDEX "Tenant_slug_key" ON "secp"."Tenant"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Tenant_subdominio_key" ON "secp"."Tenant"("subdominio");

-- CreateIndex
CREATE INDEX "Tenant_status_idx" ON "secp"."Tenant"("status");

-- CreateIndex
CREATE INDEX "Tenant_tipo_status_idx" ON "secp"."Tenant"("tipo", "status");

-- CreateIndex
CREATE INDEX "Tenant_sigla_idx" ON "secp"."Tenant"("sigla");

-- CreateIndex
CREATE INDEX "Tenant_deletedAt_idx" ON "secp"."Tenant"("deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "TenantVisualIdentity_tenantId_key" ON "secp"."TenantVisualIdentity"("tenantId");

-- CreateIndex
CREATE INDEX "TenantAuthConfig_tenantId_enabled_idx" ON "secp"."TenantAuthConfig"("tenantId", "enabled");

-- CreateIndex
CREATE UNIQUE INDEX "TenantAuthConfig_tenantId_provider_key" ON "secp"."TenantAuthConfig"("tenantId", "provider");

-- CreateIndex
CREATE INDEX "ParametroTenant_tenantId_idx" ON "secp"."ParametroTenant"("tenantId");

-- CreateIndex
CREATE UNIQUE INDEX "ParametroTenant_tenantId_chave_key" ON "secp"."ParametroTenant"("tenantId", "chave");

-- CreateIndex
CREATE INDEX "FeatureFlagTenant_tenantId_habilitado_idx" ON "secp"."FeatureFlagTenant"("tenantId", "habilitado");

-- CreateIndex
CREATE UNIQUE INDEX "FeatureFlagTenant_tenantId_chave_key" ON "secp"."FeatureFlagTenant"("tenantId", "chave");

-- CreateIndex
CREATE INDEX "PreferenciaDashboard_userId_idx" ON "secp"."PreferenciaDashboard"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "PreferenciaDashboard_userId_tenantId_perfil_key" ON "secp"."PreferenciaDashboard"("userId", "tenantId", "perfil");

-- CreateIndex
CREATE INDEX "UsuarioTenant_tenantId_userId_idx" ON "secp"."UsuarioTenant"("tenantId", "userId");

-- CreateIndex
CREATE INDEX "UsuarioTenant_tenantId_perfil_status_idx" ON "secp"."UsuarioTenant"("tenantId", "perfil", "status");

-- CreateIndex
CREATE INDEX "UsuarioTenant_servidorId_idx" ON "secp"."UsuarioTenant"("servidorId");

-- CreateIndex
CREATE INDEX "UsuarioTenant_lotacaoPrincipalId_idx" ON "secp"."UsuarioTenant"("lotacaoPrincipalId");

-- CreateIndex
CREATE UNIQUE INDEX "UsuarioTenant_tenantId_userId_perfil_key" ON "secp"."UsuarioTenant"("tenantId", "userId", "perfil");

-- CreateIndex
CREATE UNIQUE INDEX "Permissao_codigo_key" ON "secp"."Permissao"("codigo");

-- CreateIndex
CREATE INDEX "Permissao_modulo_idx" ON "secp"."Permissao"("modulo");

-- CreateIndex
CREATE INDEX "PerfilPermissaoTenant_tenantId_perfil_idx" ON "secp"."PerfilPermissaoTenant"("tenantId", "perfil");

-- CreateIndex
CREATE UNIQUE INDEX "PerfilPermissaoTenant_tenantId_perfil_permissaoId_key" ON "secp"."PerfilPermissaoTenant"("tenantId", "perfil", "permissaoId");

-- CreateIndex
CREATE INDEX "TipoUnidadeCatalogo_tenantId_ativo_idx" ON "secp"."TipoUnidadeCatalogo"("tenantId", "ativo");

-- CreateIndex
CREATE UNIQUE INDEX "TipoUnidadeCatalogo_tenantId_codigo_key" ON "secp"."TipoUnidadeCatalogo"("tenantId", "codigo");

-- CreateIndex
CREATE INDEX "UnidadeOrganizacional_tenantId_parentId_idx" ON "secp"."UnidadeOrganizacional"("tenantId", "parentId");

-- CreateIndex
CREATE INDEX "UnidadeOrganizacional_tenantId_sigla_idx" ON "secp"."UnidadeOrganizacional"("tenantId", "sigla");

-- CreateIndex
CREATE INDEX "UnidadeOrganizacional_tenantId_natureza_ativa_idx" ON "secp"."UnidadeOrganizacional"("tenantId", "natureza", "ativa");

-- CreateIndex
CREATE INDEX "UnidadeOrganizacional_tenantId_tipoCatalogoId_idx" ON "secp"."UnidadeOrganizacional"("tenantId", "tipoCatalogoId");

-- CreateIndex
CREATE INDEX "UnidadeOrganizacional_deletedAt_idx" ON "secp"."UnidadeOrganizacional"("deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "UnidadeOrganizacional_tenantId_codigo_key" ON "secp"."UnidadeOrganizacional"("tenantId", "codigo");

-- CreateIndex
CREATE INDEX "UnidadeGestor_tenantId_unidadeId_ativo_idx" ON "secp"."UnidadeGestor"("tenantId", "unidadeId", "ativo");

-- CreateIndex
CREATE INDEX "UnidadeGestor_tenantId_servidorId_ativo_idx" ON "secp"."UnidadeGestor"("tenantId", "servidorId", "ativo");

-- CreateIndex
CREATE INDEX "UnidadeGestor_inicioEm_fimEm_idx" ON "secp"."UnidadeGestor"("inicioEm", "fimEm");

-- CreateIndex
CREATE INDEX "Cargo_tenantId_ativo_idx" ON "secp"."Cargo"("tenantId", "ativo");

-- CreateIndex
CREATE UNIQUE INDEX "Cargo_tenantId_codigo_key" ON "secp"."Cargo"("tenantId", "codigo");

-- CreateIndex
CREATE INDEX "FuncaoComissionada_tenantId_ativo_idx" ON "secp"."FuncaoComissionada"("tenantId", "ativo");

-- CreateIndex
CREATE UNIQUE INDEX "FuncaoComissionada_tenantId_codigo_key" ON "secp"."FuncaoComissionada"("tenantId", "codigo");

-- CreateIndex
CREATE INDEX "Servidor_tenantId_nome_idx" ON "secp"."Servidor"("tenantId", "nome");

-- CreateIndex
CREATE INDEX "Servidor_tenantId_emailInstitucional_idx" ON "secp"."Servidor"("tenantId", "emailInstitucional");

-- CreateIndex
CREATE INDEX "Servidor_tenantId_status_idx" ON "secp"."Servidor"("tenantId", "status");

-- CreateIndex
CREATE INDEX "Servidor_tenantId_unidadeLotacaoId_idx" ON "secp"."Servidor"("tenantId", "unidadeLotacaoId");

-- CreateIndex
CREATE INDEX "Servidor_tenantId_unidadeExercicioId_idx" ON "secp"."Servidor"("tenantId", "unidadeExercicioId");

-- CreateIndex
CREATE INDEX "Servidor_cargoId_idx" ON "secp"."Servidor"("cargoId");

-- CreateIndex
CREATE INDEX "Servidor_funcaoId_idx" ON "secp"."Servidor"("funcaoId");

-- CreateIndex
CREATE INDEX "Servidor_deletedAt_idx" ON "secp"."Servidor"("deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "Servidor_tenantId_matricula_key" ON "secp"."Servidor"("tenantId", "matricula");

-- CreateIndex
CREATE UNIQUE INDEX "Servidor_tenantId_cpfHash_key" ON "secp"."Servidor"("tenantId", "cpfHash");

-- CreateIndex
CREATE UNIQUE INDEX "Servidor_tenantId_userId_key" ON "secp"."Servidor"("tenantId", "userId");

-- CreateIndex
CREATE INDEX "AfastamentoServidor_tenantId_servidorId_inicioEm_fimEm_idx" ON "secp"."AfastamentoServidor"("tenantId", "servidorId", "inicioEm", "fimEm");

-- CreateIndex
CREATE INDEX "JornadaTrabalho_tenantId_ativo_idx" ON "secp"."JornadaTrabalho"("tenantId", "ativo");

-- CreateIndex
CREATE UNIQUE INDEX "JornadaTrabalho_tenantId_codigo_key" ON "secp"."JornadaTrabalho"("tenantId", "codigo");

-- CreateIndex
CREATE INDEX "JornadaDia_diaSemana_idx" ON "secp"."JornadaDia"("diaSemana");

-- CreateIndex
CREATE UNIQUE INDEX "JornadaDia_jornadaId_diaSemana_key" ON "secp"."JornadaDia"("jornadaId", "diaSemana");

-- CreateIndex
CREATE INDEX "JornadaUnidade_tenantId_unidadeId_ativo_idx" ON "secp"."JornadaUnidade"("tenantId", "unidadeId", "ativo");

-- CreateIndex
CREATE INDEX "JornadaUnidade_tenantId_jornadaId_idx" ON "secp"."JornadaUnidade"("tenantId", "jornadaId");

-- CreateIndex
CREATE INDEX "JornadaUnidade_inicioEm_fimEm_idx" ON "secp"."JornadaUnidade"("inicioEm", "fimEm");

-- CreateIndex
CREATE INDEX "JornadaServidor_tenantId_servidorId_ativo_idx" ON "secp"."JornadaServidor"("tenantId", "servidorId", "ativo");

-- CreateIndex
CREATE INDEX "JornadaServidor_tenantId_jornadaId_idx" ON "secp"."JornadaServidor"("tenantId", "jornadaId");

-- CreateIndex
CREATE INDEX "JornadaServidor_inicioEm_fimEm_idx" ON "secp"."JornadaServidor"("inicioEm", "fimEm");

-- CreateIndex
CREATE INDEX "Feriado_tenantId_data_idx" ON "secp"."Feriado"("tenantId", "data");

-- CreateIndex
CREATE INDEX "Feriado_tenantId_tipo_idx" ON "secp"."Feriado"("tenantId", "tipo");

-- CreateIndex
CREATE UNIQUE INDEX "Feriado_tenantId_data_nome_key" ON "secp"."Feriado"("tenantId", "data", "nome");

-- CreateIndex
CREATE INDEX "RecessoForense_tenantId_status_idx" ON "secp"."RecessoForense"("tenantId", "status");

-- CreateIndex
CREATE INDEX "RecessoForense_inicioEm_fimEm_idx" ON "secp"."RecessoForense"("inicioEm", "fimEm");

-- CreateIndex
CREATE UNIQUE INDEX "RecessoForense_tenantId_anoReferencia_key" ON "secp"."RecessoForense"("tenantId", "anoReferencia");

-- CreateIndex
CREATE INDEX "ConvocacaoRecesso_tenantId_recessoId_idx" ON "secp"."ConvocacaoRecesso"("tenantId", "recessoId");

-- CreateIndex
CREATE INDEX "ConvocacaoRecesso_tenantId_servidorId_idx" ON "secp"."ConvocacaoRecesso"("tenantId", "servidorId");

-- CreateIndex
CREATE INDEX "ConvocacaoRecesso_tenantId_unidadeId_idx" ON "secp"."ConvocacaoRecesso"("tenantId", "unidadeId");

-- CreateIndex
CREATE INDEX "ConvocacaoRecesso_inicioEm_fimEm_idx" ON "secp"."ConvocacaoRecesso"("inicioEm", "fimEm");

-- CreateIndex
CREATE INDEX "DiaConvocadoRecesso_tenantId_servidorId_data_idx" ON "secp"."DiaConvocadoRecesso"("tenantId", "servidorId", "data");

-- CreateIndex
CREATE INDEX "DiaConvocadoRecesso_tenantId_compensacao_idx" ON "secp"."DiaConvocadoRecesso"("tenantId", "compensacao");

-- CreateIndex
CREATE UNIQUE INDEX "DiaConvocadoRecesso_convocacaoId_data_key" ON "secp"."DiaConvocadoRecesso"("convocacaoId", "data");

-- CreateIndex
CREATE INDEX "LocalRegistroPonto_tenantId_unidadeId_ativo_idx" ON "secp"."LocalRegistroPonto"("tenantId", "unidadeId", "ativo");

-- CreateIndex
CREATE UNIQUE INDEX "LocalRegistroPonto_tenantId_codigo_key" ON "secp"."LocalRegistroPonto"("tenantId", "codigo");

-- CreateIndex
CREATE INDEX "DispositivoPonto_tenantId_tipo_ativo_idx" ON "secp"."DispositivoPonto"("tenantId", "tipo", "ativo");

-- CreateIndex
CREATE INDEX "DispositivoPonto_tenantId_unidadeId_idx" ON "secp"."DispositivoPonto"("tenantId", "unidadeId");

-- CreateIndex
CREATE UNIQUE INDEX "DispositivoPonto_tenantId_codigo_key" ON "secp"."DispositivoPonto"("tenantId", "codigo");

-- CreateIndex
CREATE UNIQUE INDEX "DispositivoPonto_tenantId_serial_key" ON "secp"."DispositivoPonto"("tenantId", "serial");

-- CreateIndex
CREATE INDEX "BiometriaFaceTemplate_tenantId_servidorId_ativo_idx" ON "secp"."BiometriaFaceTemplate"("tenantId", "servidorId", "ativo");

-- CreateIndex
CREATE INDEX "BiometriaFaceTemplate_ativo_expiradoEm_idx" ON "secp"."BiometriaFaceTemplate"("ativo", "expiradoEm");

-- CreateIndex
CREATE UNIQUE INDEX "BiometriaFaceTemplate_tenantId_servidorId_versao_key" ON "secp"."BiometriaFaceTemplate"("tenantId", "servidorId", "versao");

-- CreateIndex
CREATE UNIQUE INDEX "BiometriaFaceTemplate_tenantId_embeddingHash_key" ON "secp"."BiometriaFaceTemplate"("tenantId", "embeddingHash");

-- CreateIndex
CREATE INDEX "BiometriaFaceSample_tenantId_servidorId_idx" ON "secp"."BiometriaFaceSample"("tenantId", "servidorId");

-- CreateIndex
CREATE INDEX "BiometriaFaceSample_templateId_idx" ON "secp"."BiometriaFaceSample"("templateId");

-- CreateIndex
CREATE UNIQUE INDEX "RegistroPonto_linhaAfdId_key" ON "secp"."RegistroPonto"("linhaAfdId");

-- CreateIndex
CREATE UNIQUE INDEX "RegistroPonto_hashRegistro_key" ON "secp"."RegistroPonto"("hashRegistro");

-- CreateIndex
CREATE INDEX "RegistroPonto_tenantId_servidorId_dataReferencia_idx" ON "secp"."RegistroPonto"("tenantId", "servidorId", "dataReferencia");

-- CreateIndex
CREATE INDEX "RegistroPonto_tenantId_dataReferencia_idx" ON "secp"."RegistroPonto"("tenantId", "dataReferencia");

-- CreateIndex
CREATE INDEX "RegistroPonto_tenantId_dataHora_idx" ON "secp"."RegistroPonto"("tenantId", "dataHora");

-- CreateIndex
CREATE INDEX "RegistroPonto_tenantId_unidadeId_dataReferencia_idx" ON "secp"."RegistroPonto"("tenantId", "unidadeId", "dataReferencia");

-- CreateIndex
CREATE INDEX "RegistroPonto_tenantId_status_idx" ON "secp"."RegistroPonto"("tenantId", "status");

-- CreateIndex
CREATE INDEX "RegistroPonto_tenantId_origem_idx" ON "secp"."RegistroPonto"("tenantId", "origem");

-- CreateIndex
CREATE INDEX "RegistroPonto_dispositivoId_idx" ON "secp"."RegistroPonto"("dispositivoId");

-- CreateIndex
CREATE INDEX "DiaPontoResumo_tenantId_data_idx" ON "secp"."DiaPontoResumo"("tenantId", "data");

-- CreateIndex
CREATE INDEX "DiaPontoResumo_tenantId_unidadeId_data_idx" ON "secp"."DiaPontoResumo"("tenantId", "unidadeId", "data");

-- CreateIndex
CREATE INDEX "DiaPontoResumo_tenantId_status_idx" ON "secp"."DiaPontoResumo"("tenantId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "DiaPontoResumo_tenantId_servidorId_data_key" ON "secp"."DiaPontoResumo"("tenantId", "servidorId", "data");

-- CreateIndex
CREATE INDEX "OcorrenciaPonto_tenantId_servidorId_dataReferencia_idx" ON "secp"."OcorrenciaPonto"("tenantId", "servidorId", "dataReferencia");

-- CreateIndex
CREATE INDEX "OcorrenciaPonto_tenantId_unidadeId_dataReferencia_idx" ON "secp"."OcorrenciaPonto"("tenantId", "unidadeId", "dataReferencia");

-- CreateIndex
CREATE INDEX "OcorrenciaPonto_tenantId_tipo_status_idx" ON "secp"."OcorrenciaPonto"("tenantId", "tipo", "status");

-- CreateIndex
CREATE INDEX "SolicitacaoPonto_tenantId_servidorId_dataReferencia_idx" ON "secp"."SolicitacaoPonto"("tenantId", "servidorId", "dataReferencia");

-- CreateIndex
CREATE INDEX "SolicitacaoPonto_tenantId_unidadeId_status_idx" ON "secp"."SolicitacaoPonto"("tenantId", "unidadeId", "status");

-- CreateIndex
CREATE INDEX "SolicitacaoPonto_tenantId_tipo_status_idx" ON "secp"."SolicitacaoPonto"("tenantId", "tipo", "status");

-- CreateIndex
CREATE INDEX "SolicitacaoPonto_analisadoPorId_idx" ON "secp"."SolicitacaoPonto"("analisadoPorId");

-- CreateIndex
CREATE INDEX "AprovacaoSolicitacao_tenantId_solicitacaoId_idx" ON "secp"."AprovacaoSolicitacao"("tenantId", "solicitacaoId");

-- CreateIndex
CREATE INDEX "AprovacaoSolicitacao_tenantId_aprovadorId_idx" ON "secp"."AprovacaoSolicitacao"("tenantId", "aprovadorId");

-- CreateIndex
CREATE INDEX "FechamentoMensal_tenantId_competencia_idx" ON "secp"."FechamentoMensal"("tenantId", "competencia");

-- CreateIndex
CREATE INDEX "FechamentoMensal_tenantId_unidadeId_status_idx" ON "secp"."FechamentoMensal"("tenantId", "unidadeId", "status");

-- CreateIndex
CREATE INDEX "FechamentoMensal_tenantId_chefiaId_status_idx" ON "secp"."FechamentoMensal"("tenantId", "chefiaId", "status");

-- CreateIndex
CREATE INDEX "FechamentoMensal_periodoInicio_periodoFim_idx" ON "secp"."FechamentoMensal"("periodoInicio", "periodoFim");

-- CreateIndex
CREATE UNIQUE INDEX "FechamentoMensal_tenantId_unidadeId_ano_mes_tipo_key" ON "secp"."FechamentoMensal"("tenantId", "unidadeId", "ano", "mes", "tipo");

-- CreateIndex
CREATE INDEX "FechamentoServidor_tenantId_servidorId_idx" ON "secp"."FechamentoServidor"("tenantId", "servidorId");

-- CreateIndex
CREATE INDEX "FechamentoServidor_tenantId_status_idx" ON "secp"."FechamentoServidor"("tenantId", "status");

-- CreateIndex
CREATE UNIQUE INDEX "FechamentoServidor_fechamentoId_servidorId_key" ON "secp"."FechamentoServidor"("fechamentoId", "servidorId");

-- CreateIndex
CREATE INDEX "ImportacaoAfd_tenantId_status_idx" ON "importacao"."ImportacaoAfd"("tenantId", "status");

-- CreateIndex
CREATE INDEX "ImportacaoAfd_tenantId_createdAt_idx" ON "importacao"."ImportacaoAfd"("tenantId", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "ImportacaoAfd_tenantId_checksumSha256_key" ON "importacao"."ImportacaoAfd"("tenantId", "checksumSha256");

-- CreateIndex
CREATE INDEX "LinhaAfd_tenantId_importacaoId_status_idx" ON "importacao"."LinhaAfd"("tenantId", "importacaoId", "status");

-- CreateIndex
CREATE INDEX "LinhaAfd_tenantId_cpfHash_dataHora_idx" ON "importacao"."LinhaAfd"("tenantId", "cpfHash", "dataHora");

-- CreateIndex
CREATE INDEX "LinhaAfd_tenantId_matricula_dataHora_idx" ON "importacao"."LinhaAfd"("tenantId", "matricula", "dataHora");

-- CreateIndex
CREATE INDEX "LinhaAfd_tenantId_nsr_idx" ON "importacao"."LinhaAfd"("tenantId", "nsr");

-- CreateIndex
CREATE UNIQUE INDEX "LinhaAfd_tenantId_importacaoId_numeroLinha_key" ON "importacao"."LinhaAfd"("tenantId", "importacaoId", "numeroLinha");

-- CreateIndex
CREATE INDEX "ArquivoAnexo_tenantId_solicitacaoId_idx" ON "secp"."ArquivoAnexo"("tenantId", "solicitacaoId");

-- CreateIndex
CREATE INDEX "ArquivoAnexo_tenantId_checksumSha256_idx" ON "secp"."ArquivoAnexo"("tenantId", "checksumSha256");

-- CreateIndex
CREATE INDEX "ArquivoAnexo_deletedAt_idx" ON "secp"."ArquivoAnexo"("deletedAt");

-- CreateIndex
CREATE INDEX "Notificacao_tenantId_userId_status_idx" ON "secp"."Notificacao"("tenantId", "userId", "status");

-- CreateIndex
CREATE INDEX "Notificacao_tenantId_canal_status_idx" ON "secp"."Notificacao"("tenantId", "canal", "status");

-- CreateIndex
CREATE INDEX "Notificacao_scheduledAt_idx" ON "secp"."Notificacao"("scheduledAt");

-- CreateIndex
CREATE INDEX "PushSubscription_userId_ativo_idx" ON "secp"."PushSubscription"("userId", "ativo");

-- CreateIndex
CREATE UNIQUE INDEX "PushSubscription_userId_endpoint_key" ON "secp"."PushSubscription"("userId", "endpoint");

-- CreateIndex
CREATE INDEX "WebhookEndpoint_tenantId_ativo_idx" ON "secp"."WebhookEndpoint"("tenantId", "ativo");

-- CreateIndex
CREATE UNIQUE INDEX "ApiKey_keyHash_key" ON "secp"."ApiKey"("keyHash");

-- CreateIndex
CREATE INDEX "ApiKey_tenantId_ativo_idx" ON "secp"."ApiKey"("tenantId", "ativo");

-- CreateIndex
CREATE INDEX "ApiKey_userId_ativo_idx" ON "secp"."ApiKey"("userId", "ativo");

-- CreateIndex
CREATE INDEX "IdempotencyKey_expiresAt_idx" ON "secp"."IdempotencyKey"("expiresAt");

-- CreateIndex
CREATE UNIQUE INDEX "IdempotencyKey_tenantId_key_key" ON "secp"."IdempotencyKey"("tenantId", "key");

-- CreateIndex
CREATE INDEX "OutboxEvent_tenantId_status_nextAttemptAt_idx" ON "secp"."OutboxEvent"("tenantId", "status", "nextAttemptAt");

-- CreateIndex
CREATE INDEX "OutboxEvent_aggregateType_aggregateId_idx" ON "secp"."OutboxEvent"("aggregateType", "aggregateId");

-- CreateIndex
CREATE INDEX "OutboxEvent_eventName_idx" ON "secp"."OutboxEvent"("eventName");

-- CreateIndex
CREATE INDEX "AuditoriaEvento_tenantId_createdAt_idx" ON "audit"."AuditoriaEvento"("tenantId", "createdAt");

-- CreateIndex
CREATE INDEX "AuditoriaEvento_tenantId_entidade_entidadeId_idx" ON "audit"."AuditoriaEvento"("tenantId", "entidade", "entidadeId");

-- CreateIndex
CREATE INDEX "AuditoriaEvento_userId_createdAt_idx" ON "audit"."AuditoriaEvento"("userId", "createdAt");

-- CreateIndex
CREATE INDEX "AuditoriaEvento_severidade_createdAt_idx" ON "audit"."AuditoriaEvento"("severidade", "createdAt");

-- CreateIndex
CREATE INDEX "AuditoriaEvento_correlationId_idx" ON "audit"."AuditoriaEvento"("correlationId");

-- CreateIndex
CREATE INDEX "JobProcessamento_tenantId_fila_status_idx" ON "secp"."JobProcessamento"("tenantId", "fila", "status");

-- CreateIndex
CREATE INDEX "JobProcessamento_scheduledAt_idx" ON "secp"."JobProcessamento"("scheduledAt");

-- AddForeignKey
ALTER TABLE "auth"."Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "auth"."Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "auth"."Authenticator" ADD CONSTRAINT "Authenticator_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "auth"."UserGlobalRole" ADD CONSTRAINT "UserGlobalRole_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "auth"."IdentidadeExterna" ADD CONSTRAINT "IdentidadeExterna_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "auth"."IdentidadeExterna" ADD CONSTRAINT "IdentidadeExterna_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "auth"."CertificadoDigitalVinculo" ADD CONSTRAINT "CertificadoDigitalVinculo_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "auth"."CertificadoDigitalVinculo" ADD CONSTRAINT "CertificadoDigitalVinculo_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."TenantVisualIdentity" ADD CONSTRAINT "TenantVisualIdentity_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."TenantAuthConfig" ADD CONSTRAINT "TenantAuthConfig_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."ParametroTenant" ADD CONSTRAINT "ParametroTenant_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FeatureFlagTenant" ADD CONSTRAINT "FeatureFlagTenant_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."PreferenciaDashboard" ADD CONSTRAINT "PreferenciaDashboard_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UsuarioTenant" ADD CONSTRAINT "UsuarioTenant_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UsuarioTenant" ADD CONSTRAINT "UsuarioTenant_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UsuarioTenant" ADD CONSTRAINT "UsuarioTenant_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UsuarioTenant" ADD CONSTRAINT "UsuarioTenant_lotacaoPrincipalId_fkey" FOREIGN KEY ("lotacaoPrincipalId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."PerfilPermissaoTenant" ADD CONSTRAINT "PerfilPermissaoTenant_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."PerfilPermissaoTenant" ADD CONSTRAINT "PerfilPermissaoTenant_permissaoId_fkey" FOREIGN KEY ("permissaoId") REFERENCES "secp"."Permissao"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."TipoUnidadeCatalogo" ADD CONSTRAINT "TipoUnidadeCatalogo_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UnidadeOrganizacional" ADD CONSTRAINT "UnidadeOrganizacional_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UnidadeOrganizacional" ADD CONSTRAINT "UnidadeOrganizacional_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UnidadeOrganizacional" ADD CONSTRAINT "UnidadeOrganizacional_tipoCatalogoId_fkey" FOREIGN KEY ("tipoCatalogoId") REFERENCES "secp"."TipoUnidadeCatalogo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UnidadeGestor" ADD CONSTRAINT "UnidadeGestor_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."UnidadeGestor" ADD CONSTRAINT "UnidadeGestor_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Cargo" ADD CONSTRAINT "Cargo_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FuncaoComissionada" ADD CONSTRAINT "FuncaoComissionada_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Servidor" ADD CONSTRAINT "Servidor_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Servidor" ADD CONSTRAINT "Servidor_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Servidor" ADD CONSTRAINT "Servidor_cargoId_fkey" FOREIGN KEY ("cargoId") REFERENCES "secp"."Cargo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Servidor" ADD CONSTRAINT "Servidor_funcaoId_fkey" FOREIGN KEY ("funcaoId") REFERENCES "secp"."FuncaoComissionada"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Servidor" ADD CONSTRAINT "Servidor_unidadeLotacaoId_fkey" FOREIGN KEY ("unidadeLotacaoId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Servidor" ADD CONSTRAINT "Servidor_unidadeExercicioId_fkey" FOREIGN KEY ("unidadeExercicioId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."AfastamentoServidor" ADD CONSTRAINT "AfastamentoServidor_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."JornadaTrabalho" ADD CONSTRAINT "JornadaTrabalho_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."JornadaDia" ADD CONSTRAINT "JornadaDia_jornadaId_fkey" FOREIGN KEY ("jornadaId") REFERENCES "secp"."JornadaTrabalho"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."JornadaUnidade" ADD CONSTRAINT "JornadaUnidade_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."JornadaUnidade" ADD CONSTRAINT "JornadaUnidade_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."JornadaUnidade" ADD CONSTRAINT "JornadaUnidade_jornadaId_fkey" FOREIGN KEY ("jornadaId") REFERENCES "secp"."JornadaTrabalho"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."JornadaServidor" ADD CONSTRAINT "JornadaServidor_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."JornadaServidor" ADD CONSTRAINT "JornadaServidor_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."JornadaServidor" ADD CONSTRAINT "JornadaServidor_jornadaId_fkey" FOREIGN KEY ("jornadaId") REFERENCES "secp"."JornadaTrabalho"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Feriado" ADD CONSTRAINT "Feriado_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."RecessoForense" ADD CONSTRAINT "RecessoForense_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."ConvocacaoRecesso" ADD CONSTRAINT "ConvocacaoRecesso_recessoId_fkey" FOREIGN KEY ("recessoId") REFERENCES "secp"."RecessoForense"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."ConvocacaoRecesso" ADD CONSTRAINT "ConvocacaoRecesso_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."ConvocacaoRecesso" ADD CONSTRAINT "ConvocacaoRecesso_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."DiaConvocadoRecesso" ADD CONSTRAINT "DiaConvocadoRecesso_convocacaoId_fkey" FOREIGN KEY ("convocacaoId") REFERENCES "secp"."ConvocacaoRecesso"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."DiaConvocadoRecesso" ADD CONSTRAINT "DiaConvocadoRecesso_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."LocalRegistroPonto" ADD CONSTRAINT "LocalRegistroPonto_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."LocalRegistroPonto" ADD CONSTRAINT "LocalRegistroPonto_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."DispositivoPonto" ADD CONSTRAINT "DispositivoPonto_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."DispositivoPonto" ADD CONSTRAINT "DispositivoPonto_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."DispositivoPonto" ADD CONSTRAINT "DispositivoPonto_localId_fkey" FOREIGN KEY ("localId") REFERENCES "secp"."LocalRegistroPonto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."BiometriaFaceTemplate" ADD CONSTRAINT "BiometriaFaceTemplate_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."BiometriaFaceTemplate" ADD CONSTRAINT "BiometriaFaceTemplate_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."BiometriaFaceSample" ADD CONSTRAINT "BiometriaFaceSample_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."BiometriaFaceSample" ADD CONSTRAINT "BiometriaFaceSample_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES "secp"."BiometriaFaceTemplate"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."RegistroPonto" ADD CONSTRAINT "RegistroPonto_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."RegistroPonto" ADD CONSTRAINT "RegistroPonto_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."RegistroPonto" ADD CONSTRAINT "RegistroPonto_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."RegistroPonto" ADD CONSTRAINT "RegistroPonto_dispositivoId_fkey" FOREIGN KEY ("dispositivoId") REFERENCES "secp"."DispositivoPonto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."RegistroPonto" ADD CONSTRAINT "RegistroPonto_localId_fkey" FOREIGN KEY ("localId") REFERENCES "secp"."LocalRegistroPonto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."RegistroPonto" ADD CONSTRAINT "RegistroPonto_linhaAfdId_fkey" FOREIGN KEY ("linhaAfdId") REFERENCES "importacao"."LinhaAfd"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."DiaPontoResumo" ADD CONSTRAINT "DiaPontoResumo_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."DiaPontoResumo" ADD CONSTRAINT "DiaPontoResumo_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."DiaPontoResumo" ADD CONSTRAINT "DiaPontoResumo_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."OcorrenciaPonto" ADD CONSTRAINT "OcorrenciaPonto_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."OcorrenciaPonto" ADD CONSTRAINT "OcorrenciaPonto_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."OcorrenciaPonto" ADD CONSTRAINT "OcorrenciaPonto_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."OcorrenciaPonto" ADD CONSTRAINT "OcorrenciaPonto_diaResumoId_fkey" FOREIGN KEY ("diaResumoId") REFERENCES "secp"."DiaPontoResumo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."OcorrenciaPonto" ADD CONSTRAINT "OcorrenciaPonto_registroPontoId_fkey" FOREIGN KEY ("registroPontoId") REFERENCES "secp"."RegistroPonto"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."SolicitacaoPonto" ADD CONSTRAINT "SolicitacaoPonto_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."SolicitacaoPonto" ADD CONSTRAINT "SolicitacaoPonto_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."SolicitacaoPonto" ADD CONSTRAINT "SolicitacaoPonto_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."SolicitacaoPonto" ADD CONSTRAINT "SolicitacaoPonto_analisadoPorId_fkey" FOREIGN KEY ("analisadoPorId") REFERENCES "secp"."Servidor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."AprovacaoSolicitacao" ADD CONSTRAINT "AprovacaoSolicitacao_solicitacaoId_fkey" FOREIGN KEY ("solicitacaoId") REFERENCES "secp"."SolicitacaoPonto"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."AprovacaoSolicitacao" ADD CONSTRAINT "AprovacaoSolicitacao_aprovadorId_fkey" FOREIGN KEY ("aprovadorId") REFERENCES "secp"."Servidor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FechamentoMensal" ADD CONSTRAINT "FechamentoMensal_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FechamentoMensal" ADD CONSTRAINT "FechamentoMensal_unidadeId_fkey" FOREIGN KEY ("unidadeId") REFERENCES "secp"."UnidadeOrganizacional"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FechamentoMensal" ADD CONSTRAINT "FechamentoMensal_chefiaId_fkey" FOREIGN KEY ("chefiaId") REFERENCES "secp"."Servidor"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FechamentoMensal" ADD CONSTRAINT "FechamentoMensal_recessoId_fkey" FOREIGN KEY ("recessoId") REFERENCES "secp"."RecessoForense"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FechamentoServidor" ADD CONSTRAINT "FechamentoServidor_fechamentoId_fkey" FOREIGN KEY ("fechamentoId") REFERENCES "secp"."FechamentoMensal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FechamentoServidor" ADD CONSTRAINT "FechamentoServidor_servidorId_fkey" FOREIGN KEY ("servidorId") REFERENCES "secp"."Servidor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."FechamentoServidor" ADD CONSTRAINT "FechamentoServidor_jornadaId_fkey" FOREIGN KEY ("jornadaId") REFERENCES "secp"."JornadaTrabalho"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "importacao"."ImportacaoAfd" ADD CONSTRAINT "ImportacaoAfd_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "importacao"."LinhaAfd" ADD CONSTRAINT "LinhaAfd_importacaoId_fkey" FOREIGN KEY ("importacaoId") REFERENCES "importacao"."ImportacaoAfd"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."ArquivoAnexo" ADD CONSTRAINT "ArquivoAnexo_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."ArquivoAnexo" ADD CONSTRAINT "ArquivoAnexo_solicitacaoId_fkey" FOREIGN KEY ("solicitacaoId") REFERENCES "secp"."SolicitacaoPonto"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Notificacao" ADD CONSTRAINT "Notificacao_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."Notificacao" ADD CONSTRAINT "Notificacao_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."PushSubscription" ADD CONSTRAINT "PushSubscription_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."WebhookEndpoint" ADD CONSTRAINT "WebhookEndpoint_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."ApiKey" ADD CONSTRAINT "ApiKey_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."ApiKey" ADD CONSTRAINT "ApiKey_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "secp"."OutboxEvent" ADD CONSTRAINT "OutboxEvent_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "audit"."AuditoriaEvento" ADD CONSTRAINT "AuditoriaEvento_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "secp"."Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "audit"."AuditoriaEvento" ADD CONSTRAINT "AuditoriaEvento_userId_fkey" FOREIGN KEY ("userId") REFERENCES "auth"."User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

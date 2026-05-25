-- ─────────────────────────────────────────────────────────────
-- REFORMA TRIBUTÁRIA — Setup do banco de dados no Supabase
-- Execute no SQL Editor do seu projeto (supabase.com)
-- ─────────────────────────────────────────────────────────────

-- Remove tabela antiga se existir
drop table if exists diagnosticos;

-- Cria tabela principal
create table diagnosticos (
  id           uuid        default gen_random_uuid() primary key,
  created_at   timestamptz default now(),

  -- Identificação do respondente
  nome         text        not null,
  empresa      text        not null,
  contato      text        not null,

  -- Resultado do diagnóstico
  urgencia     text        not null check (urgencia in ('ALTO', 'MEDIO', 'BAIXO')),
  score_total  numeric,
  resumo       text,
  diagnostico  text,

  -- Perfil da empresa (campos indexados para filtros no painel)
  regime       text,
  faturamento  text,
  setor        text,

  -- Todas as respostas brutas (para análise futura)
  respostas    jsonb
);

-- Índices para o painel carregar mais rápido
create index on diagnosticos (created_at desc);
create index on diagnosticos (urgencia);
create index on diagnosticos (regime);

-- Segurança: habilita RLS
alter table diagnosticos enable row level security;

-- Qualquer visitante pode inserir (preencher o formulário)
create policy "allow_insert"
  on diagnosticos for insert
  to anon
  with check (true);

-- Qualquer visitante pode ler (painel de diagnósticos)
create policy "allow_select"
  on diagnosticos for select
  to anon
  using (true);

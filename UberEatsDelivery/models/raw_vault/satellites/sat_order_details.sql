{{- config(
    materialized='incremental',
    tags=['raw_vault', 'satellite']
) -}}

{%- set source_model = "stg_orders" -%}
{%- set src_pk = "ORDER_HK" -%}
{%- set src_hashdiff = "ORDER_HASHDIFF" -%}
{%- set src_payload = ["ORDER_DATE", "TOTAL_AMOUNT", "PAYMENT_KEY"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DTS" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ automate_dv.sat(src_pk=src_pk,
                   src_hashdiff=src_hashdiff,
                   src_payload=src_payload,
                   src_eff=src_eff,
                   src_ldts=src_ldts,
                   src_source=src_source,
                   source_model=source_model) }}
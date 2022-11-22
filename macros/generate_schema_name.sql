{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}

    {%- if custom_schema_name is none -%}
        {#
            custom schema name wasn't specified
            use default schema name (e.g. User's schema)
        #}
        {{ default_schema }}

    {%- else -%}
        {# 
            custom schema name was specified at model, directory, or project_level
            use custom schema name as final schema name
        #}
        {{ custom_schema_name | trim }}

    {%- endif -%}
{%- endmacro %}
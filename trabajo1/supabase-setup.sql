-- ============================================================
-- EJECUTA ESTE SQL EN: Supabase → SQL Editor → New Query
-- ============================================================

-- 1. CREAR LA TABLA DE TRABAJOS
create table if not exists trabajos (
  id uuid primary key default gen_random_uuid(),

  unidad int not null,
  semana int not null,

  nombre text not null,
  descripcion text,

  url text,
  tipo text,

  visible boolean default true,

  created_at timestamp with time zone default now()
);


-- 2. HABILITAR ROW LEVEL SECURITY
ALTER TABLE trabajos ENABLE ROW LEVEL SECURITY;

-- 3. POLÍTICA: cualquiera puede VER trabajos activos (página pública)
CREATE POLICY "Lectura pública de trabajos activos"
  ON trabajos FOR SELECT
  USING (activo = TRUE)
  with check (true);

-- 4. POLÍTICA: solo usuarios autenticados (admin) pueden insertar
CREATE POLICY "Admin puede insertar"
  ON trabajos FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- 5. POLÍTICA: solo admin puede actualizar
CREATE POLICY "Admin puede actualizar"
  ON trabajos FOR UPDATE
  TO authenticated
  USING (true);

-- 6. POLÍTICA: solo admin puede eliminar
CREATE POLICY "Admin puede eliminar"
  ON trabajos FOR DELETE
  TO authenticated
  USING (true);


-- ============================================================
-- STORAGE: Ve a Storage en el panel de Supabase y haz esto:
-- ============================================================
-- 1. Crea un bucket llamado: trabajos
-- 2. Marca la opción "Public bucket"
-- 3. En Policies del bucket, agrega:
--    - INSERT para: authenticated
--    - SELECT para: public (anon)
--    - DELETE para: authenticated
-- ============================================================


-- ============================================================
-- PARA CREAR EL ADMIN:
-- Ve a Supabase → Authentication → Users → Add user
-- O usa Invite user por email
-- ============================================================

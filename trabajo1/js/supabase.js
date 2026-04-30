import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm'

const SUPABASE_URL = 'https://uhcrijrmckpagnkilclq.supabase.co'
const SUPABASE_ANON_KEY = 'sb_publishable_ssLtd3jyOa7EYUzjEHLjqg_gpVFQTcw'

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)

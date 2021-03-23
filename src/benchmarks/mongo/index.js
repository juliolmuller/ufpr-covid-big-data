import { getConnection } from '../../database/mongo'

async function runBenchmarks() {
  const client = await getConnection()

  try {
    const dbs = await client.db().admin().listDatabases()

    console.log(dbs)
  } catch (error) {
    console.error(error)
  } finally {
    client.close()
  }
}

export default runBenchmarks
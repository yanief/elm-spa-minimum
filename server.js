const express = require('express')
const app = express()
const path = require('path')

const port = 3000

const serveIndex = (request, response) => {
  response.sendFile(path.join(__dirname, 'index.html'));
}
app.use('/dist', express.static(path.join(__dirname, 'dist')))
app.get('/', serveIndex)
app.get('/*', serveIndex)

app.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`)
})

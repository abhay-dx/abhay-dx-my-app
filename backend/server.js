const express = require("express");
const app = express();
const path = require("path");

// Serve frontend build
app.use(express.static(path.join(__dirname, "public")));

app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"));
});

// Your API routes
// app.use("/api", require("./routes/messageRoute"));

app.listen(5000, () => {
  console.log("Server running on port 5000");
});

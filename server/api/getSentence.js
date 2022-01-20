const axios = require("axios");

const getSentence = async () => {
  const jokeData = await axios.get("https://api.quotable.io/random");

  return jokeData.data.content.split(" ");
};

module.exports = getSentence;

{
  services.ollama = {
    enable = true;
    host = "0.0.0.0";
    environmentVariables = {
      OLLAMA_API_KEY = "TBERkxwgsfB4425yQwt3qTa9";
    };
    acceleration = "cuda";
  };
}

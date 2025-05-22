FROM rasa/rasa:3.5.10
 
WORKDIR /app
 
COPY . /app
 
# Pour installer d'éventuelles dépendances Python (optionnel)
RUN pip install -r requirements.txt || true
 
# Entraîner le modèle automatiquement à la création de l'image
RUN rasa train
 
CMD ["run", "--enable-api", "--cors", "*", "--debug"]

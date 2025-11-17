# Compilateur et options
CXX      := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Wpedantic -O2

# Dossier contenant le code
COMP_DIR := Components

# Fichiers source trouvés automatiquement
SRC := $(wildcard $(COMP_DIR)/*.cpp)

# Objets générés
OBJ := $(SRC:.cpp=.o)

# Nom de l'exécutable final
TARGET := game_of_life

# Règle par défaut
all: $(TARGET)

# Edition de liens
$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $@

# Compilation des .cpp en .o
$(COMP_DIR)/%.o: $(COMP_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Nettoyage
clean:
	rm -f $(OBJ) $(TARGET)

# Exécution rapide
run: $(TARGET)
	./$(TARGET)

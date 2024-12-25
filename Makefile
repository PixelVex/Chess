# Directories
SRCDIR = src
BINDIR = build
COREDIR = $(SRCDIR)/core
AUDIODIR = $(SRCDIR)/audio
INPUTDIR = $(SRCDIR)/input
NETWORKDIR = $(SRCDIR)/network
GRAPHICSDIR = $(SRCDIR)/graphics

# Source files
SOURCES = $(wildcard $(COREDIR)/*.cpp $(AUDIODIR)/*.cpp $(INPUTDIR)/*.cpp $(NETWORKDIR)/*.cpp $(GRAPHICSDIR)/*.cpp)

# Object files
OBJECTS = $(patsubst $(SRCDIR)/%.cpp, $(BINDIR)/%.o, $(SOURCES))

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -I$(SRCDIR)

# Target executable
TARGET = $(BINDIR)/Chess#Name of the Game

# Build rules
all: $(TARGET)

# Link objects to create the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files into object files
$(BINDIR)/%.o: $(SRCDIR)/%.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean build files
clean:
	rm -rf $(BINDIR)

# Print all source files (optional utility)
print_sources:
	@echo $(SOURCES)

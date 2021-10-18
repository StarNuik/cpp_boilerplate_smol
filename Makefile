#? Project info
NAM = project
EXT = .exe

#? External stuff
INC += 
LIB = 

#? Project files
SRC = $(shell find -name "*.cpp")
INC = -I include/

#? Compillation settings
CCC = g++
FLG = 

#? Compilation variables
BIN = $(NAM)$(EXT)
OBJ = $(SRC:.cpp=.o)
DEP = $(patsubst %.o, %.d, $(OBJ))

#? Colors for fun
FRMT_RST = \e[0m
FRMT_ULN = \e[4m
FRMT_GRN = \e[32m
FRMT_YLW = \e[33m
FRMT_GRY = \e[37m

all: $(BIN)
	@echo -e "$(FRMT_GRN)Compilation successful$(FRMT_RST)"

-include $(DEP)
%.o: %.cpp
	$(CCC) -c $< $(FLG) -MMD -MP -o $@ $(INC)

$(BIN) : banner_objs $(OBJ) banner_bin binclean
	$(CCC) $(FLG) -o $(BIN) $(FRM) $(OBJ) $(LIB)

clean:
	@rm -f $(OBJ) $(DEP)

binclean:
	@rm -f $(BIN)

fclean: binclean clean

re: clean all



banner_objs:
	@echo -e "$(FRMT_YLW)Compiling files$(FRMT_RST)"

banner_bin:
	@echo -e "$(FRMT_YLW)Linking the binary$(FRMT_RST)"
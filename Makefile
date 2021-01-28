NAME		= computor

DIRS		= ComputorV1/

LIST		=	Parser.swift	\
			main.swift

SOURCE		= $(addprefix $(DIRS), $(LIST))
OBJ		= $(patsubst %.swift,%.o,$(SOURCE))

all:
	@make $(NAME)

%.o: %.swift
	@swiftc -c $< -o $@

$(NAME): $(OBJ)
	@swiftc $(OBJ) -o $(NAME)

clean:
	@rm -f $(OBJ)

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re debug test
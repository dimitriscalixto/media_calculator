defmodule Calculator do
    
    def start() do 
        dimitris =  %Student{name: "Dimitris Carvalho Calixto", results: build_subjects([9.8, 3.9, 5.8, 8.5])}
        joao =  %Student{name: "João Joaquim", results: build_subjects([9.8, 3.9, 5.8, 8.5])}
        maria =  %Student{name: "Maria Silva", results: build_subjects([9.8, 3.9, 5.8, 8.5])}
        pedro =  %Student{name: "Pedro Pedrada", results: build_subjects([9.8, 3.9, 5.8, 8.5])}

        result = calculate([pedro, joao, maria, dimitris])
        best = best_result(result)

        {result, best}
    end 

    defp best_result(students) do
        max_result = 
            students
            |> Enum.map(& &1.average)
            |> Enum.max()

        students
        |> Enum.filter(& &1.average == max_result)
    end
    defp calculate(students) do
        students
        |> Enum.map(&
        (%{
        average: average(&1),
        first_name: Student.first_name(&1),
        last_name: Student.last_name(&1)
        }))
    end
    
    defp average(student) do
        number_of_subjects = Enum.count(student.results)
        sum_of_grades =
            student.results
            |> Enum.map(& &1.result) # [9.8, 3.9, 5.8, 8.5]
            |> Enum.reduce(&(&1 +&2))
            Float.ceil(sum_of_grades / number_of_subjects)
    end
    defp build_subjects(grades_list) do 
       subjects = ["Matemática", "Português", "Geografia", "História"]
       subjects
       |>Enum.map(&(%Subject{ name: &1, result: Enum.random(grades_list)}))
    end
end
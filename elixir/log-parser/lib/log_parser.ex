defmodule LogParser do
  def valid_line?(line) do
    String.starts_with?(line, ["[DEBUG]", "[INFO]", "[WARNING]", "[ERROR]"])
  end

  def split_line(line) do
    String.split(line, ~r/<[~*=-]*>/)
  end

  def remove_artifacts(line) do
    String.replace(line, ~r/end\-of\-line\d+/i, "")
  end

  def tag_with_user_name(line) do
    case Regex.run(~r/User\s+([^\s]+)/, line) do
      [_ | [username | _]] -> "[USER] " <> username <> " " <> line
      nil -> line
    end
  end
end

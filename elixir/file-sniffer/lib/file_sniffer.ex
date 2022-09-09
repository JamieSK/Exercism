defmodule FileSniffer do
  def type_from_extension(extension) do
    case extension do
      "exe" -> "application/octet-stream"
      "bmp" -> "image/bmp"
      "png" -> "image/png"
      "jpg" -> "image/jpg"
      "gif" -> "image/gif"
    end
  end

  def type_from_binary(file_binary) do
    case file_binary do
      <<sig::binary-size(4), _::binary>> when sig == <<0x7F, 0x45, 0x4C, 0x46>> -> "application/octet-stream"
      <<sig::binary-size(2), _::binary>> when sig == <<0x42, 0x4D>> -> "image/bmp"
      <<sig::binary-size(8), _::binary>> when sig == <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>> -> "image/png"
      <<sig::binary-size(3), _::binary>> when sig == <<0xFF, 0xD8, 0xFF>> -> "image/jpg"
      <<sig::binary-size(3), _::binary>> when sig == <<0x47, 0x49, 0x46>> -> "image/gif"
    end
  end

  def verify(file_binary, extension) do
    tfe = type_from_extension(extension)
    if tfe == type_from_binary(file_binary) do
      {:ok, tfe}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end

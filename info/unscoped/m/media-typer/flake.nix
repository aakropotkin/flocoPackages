{

  inputs.packument.url   = "https://registry.npmjs.org/media-typer?rev=19-04679a8fef058078fdbfc4fa601f5a40";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "media-typer";
    ldir  = "info/unscoped/m/media-typer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/markdown-it?rev=185-d23cf2b9b3832943724b7cd7f70d5ffd";
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
    ident = "markdown-it";
    ldir  = "info/unscoped/m/markdown-it";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

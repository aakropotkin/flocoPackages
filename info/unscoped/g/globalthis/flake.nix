{

  inputs.packument.url   = "https://registry.npmjs.org/globalthis?rev=6-1986a7d18c9a4a4e003de2092aa2ae2e";
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
    ident = "globalthis";
    ldir  = "info/unscoped/g/globalthis";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

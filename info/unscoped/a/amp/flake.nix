{

  inputs.packument.url   = "https://registry.npmjs.org/amp?rev=16-a88c3c00c7b26a85f241ea53dc796f00";
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
    ident = "amp";
    ldir  = "info/unscoped/a/amp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

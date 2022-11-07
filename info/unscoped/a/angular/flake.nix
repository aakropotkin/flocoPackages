{

  inputs.packument.url   = "https://registry.npmjs.org/angular?rev=719-08e3dbed8eab983b5227fccef20a572d";
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
    ident = "angular";
    ldir  = "info/unscoped/a/angular";
    inherit packument fetchInfo;
  } // latest';

}

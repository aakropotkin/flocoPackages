{

  inputs.packument.url   = "https://registry.npmjs.org/unique-filename?rev=34-982f37b02c46050d33591dacc6702297";
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
    ident = "unique-filename";
    ldir  = "info/unscoped/u/unique-filename";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

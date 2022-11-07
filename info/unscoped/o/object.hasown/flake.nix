{

  inputs.packument.url   = "https://registry.npmjs.org/object.hasown?rev=4-c5b3361d7efc63a29d21d51514ec3977";
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
    ident = "object.hasown";
    ldir  = "info/unscoped/o/object.hasown";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

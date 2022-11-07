{

  inputs.packument.url   = "https://registry.npmjs.org/object.map?rev=13-6ac561f034dade353a808f8533c4a989";
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
    ident = "object.map";
    ldir  = "info/unscoped/o/object.map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/array-parallel?rev=38-78ae45b955662fff2be20bc3509ac6b1";
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
    ident = "array-parallel";
    ldir  = "info/unscoped/a/array-parallel";
    inherit packument fetchInfo;
  } // latest';

}

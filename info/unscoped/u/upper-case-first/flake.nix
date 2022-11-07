{

  inputs.packument.url   = "https://registry.npmjs.org/upper-case-first?rev=18-a438d77dba1f99851c6d7605ba720e6b";
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
    ident = "upper-case-first";
    ldir  = "info/unscoped/u/upper-case-first";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}

{

  inputs.packument.url   = "https://registry.npmjs.org/meow?rev=149-cfadb00687948fe37ff265c38598c6f3";
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
    ident = "meow";
    ldir  = "info/unscoped/m/meow";
    inherit packument fetchInfo;
  } // latest';

}

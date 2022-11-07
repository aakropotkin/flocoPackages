{

  inputs.packument.url   = "https://registry.npmjs.org/oboe?rev=130-67433c8261dd08063fe59a8c5a3ed68b";
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
    ident = "oboe";
    ldir  = "info/unscoped/o/oboe";
    inherit packument fetchInfo;
  } // latest';

}

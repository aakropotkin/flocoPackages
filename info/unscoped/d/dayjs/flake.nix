{

  inputs.packument.url   = "https://registry.npmjs.org/dayjs?rev=131-87357fa3d48d6e039728ef621f26aedb";
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
    ident = "dayjs";
    ldir  = "info/unscoped/d/dayjs";
    inherit packument fetchInfo;
  } // latest';

}

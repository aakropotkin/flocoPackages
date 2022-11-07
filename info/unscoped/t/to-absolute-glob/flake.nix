{

  inputs.packument.url   = "https://registry.npmjs.org/to-absolute-glob?rev=12-1e6e678ad7ceadb558e3f8a0ec2b0f91";
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
    ident = "to-absolute-glob";
    ldir  = "info/unscoped/t/to-absolute-glob";
    inherit packument fetchInfo;
  } // latest';

}

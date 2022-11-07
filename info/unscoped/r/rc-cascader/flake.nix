{

  inputs.packument.url   = "https://registry.npmjs.org/rc-cascader?rev=131-654dc2e8e3a467be76b4b3b43af7e23a";
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
    ident = "rc-cascader";
    ldir  = "info/unscoped/r/rc-cascader";
    inherit packument fetchInfo;
  } // latest';

}

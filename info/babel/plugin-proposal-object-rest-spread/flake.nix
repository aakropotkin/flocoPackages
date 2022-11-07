{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-proposal-object-rest-spread?rev=112-239046680644dd1ad561652c337f4316";
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
    scope = "@babel";
    ident = "@babel/plugin-proposal-object-rest-spread";
    ldir  = "info/babel/plugin-proposal-object-rest-spread";
    inherit packument fetchInfo;
  } // latest';

}
